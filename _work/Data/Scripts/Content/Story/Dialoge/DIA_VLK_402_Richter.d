// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Richter_EXIT(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 999;
	condition	= DIA_Richter_EXIT_Condition;
	information	= DIA_Richter_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Richter_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Richter_Hello(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 4;
	condition	= DIA_Richter_Hello_Condition;
	information	= DIA_Richter_Hello_Info;
	permanent	= FALSE;
	description = "Co tu porabiasz?";
};                       

FUNC INT DIA_Richter_Hello_Condition()
{
	if (MIS_Lee_JudgeRichter == 0)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Richter_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Richter_Hello_15_00"); //Czym się zajmujesz?
	AI_Output (self ,other,"DIA_Richter_Hello_10_01"); //A jak ci się wydaje? Kim ty właściwie jesteś?
	AI_Output (other,self ,"DIA_Richter_Hello_15_02"); //Ja, em...
	AI_Output (self ,other,"DIA_Richter_Hello_10_03"); //Słuchaj no, czy ja cię skądś nie znam?
	
	Info_ClearChoices (DIA_Richter_Hello);
	Info_AddChoice (DIA_Richter_Hello,"Nie przypominam sobie.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice (DIA_Richter_Hello,"Możliwe.",DIA_Richter_Hello_MayBe);
};

FUNC VOID DIA_Richter_Hello_DontThinkSo ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_DontThinkSo_15_00"); //Nie przypominam sobie.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_01"); //To zabawne. Mógłbym przysiąc, żeśmy się już spotkali.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_02"); //Nieważne, pewnie jesteś jakąś szumowiną z rynsztoka. Wszyscy wyglądacie tak samo.
};

FUNC VOID DIA_Richter_Hello_MayBe ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_MayBe_15_00"); //Możliwe.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_01"); //Nie wymądrzaj się. Nie rozmawiasz z byle kim.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_02"); //Mógłbyś przynajmniej zwracać się do mnie z należnym szacunkiem.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_03"); //A teraz, zejdź mi z oczu.
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Perm 
// ************************************************************

INSTANCE DIA_Richter_Perm(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 800;
	condition	= DIA_Richter_Perm_Condition;
	information	= DIA_Richter_Perm_Info;
	permanent	= TRUE;
	description = "Co słychać?";
};                       

FUNC INT DIA_Richter_Perm_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter == LOG_RUNNING))
	&& (SCIstRichtersLakai == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_Perm_Info()
{	
	AI_Output (other,self ,"DIA_Richter_Perm_15_00"); //Jak leci?

	if (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG ))
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_01"); //Lepiej odejdź, cuchnący najemniku, zanim wezwę straże.
		AI_Output (other,self ,"DIA_Richter_Perm_15_02"); //Uspokój się. Nie przyszedłem tu, by cię okradać. Szukam pracy.
		AI_Output (self ,other,"DIA_Richter_Perm_10_03"); //Ach, więc chcesz dla mnie pracować. To zupełnie zmienia postać rzeczy.
		AI_Output (self ,other,"DIA_Richter_Perm_10_04"); //Jest tylko jeden mały problem. Nie wiem, czy mogę ci zaufać. Musisz dowieść swojej lojalności.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_05"); //Czyż nie powiedziałem jasno, że nie chcę być niepokojony?
		AI_Output (other,self ,"DIA_Richter_Perm_15_06"); //Widocznie coś przeoczyłem.
		AI_Output (self ,other,"DIA_Richter_Perm_10_07"); //Mam więc nadzieję, że teraz to do ciebie dotrze.
	};
};

// ************************************************************
// 			  				   RichtersLakai 
// ************************************************************

INSTANCE DIA_Richter_RichtersLakai (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_RichtersLakai_Condition;
	information	= DIA_Richter_RichtersLakai_Info;

	description = "Poddaj mnie próbie.";
};                       

FUNC INT DIA_Richter_RichtersLakai_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter != 0))
	&& (SCIstRichtersLakai == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_RichtersLakai_Info()
{	
	AI_Output (other,self ,"DIA_Richter_RichtersLakai_15_00"); //Poddaj mnie próbie.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_01"); //Mmm. Dobrze, posłuchaj. Przynieś mi święty młot Magów Ognia. Trzymają go gdzieś w klasztornych piwnicach.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_02"); //Jeśli ci się to uda, zatrudnię cię jako ochroniarza.
	
	Info_ClearChoices	(DIA_Richter_RichtersLakai);
	Info_AddChoice	(DIA_Richter_RichtersLakai, "Mam okraść magów? Czyś ty na głowę upadł?", DIA_Richter_RichtersLakai_nein );
	Info_AddChoice	(DIA_Richter_RichtersLakai, "W porządku.", DIA_Richter_RichtersLakai_ja );
	
	B_LogEntry (TOPIC_RichterLakai,"Sędzia mi nie ufa. Muszę udowodnić swoją lojalność. W tym celu mam ukraść święty młot z podziemi klasztoru Magów Ognia i zanieść go sędziemu."); 

	MIS_Richter_BringHolyHammer = LOG_RUNNING;
};
func void DIA_Richter_RichtersLakai_nein ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_nein_15_00"); //Mam okraść magów? Czyś ty na głowę upadł?
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_nein_10_01"); //W takim razie, idź do diabła i nie marnuj mojego czasu.
	AI_StopProcessInfos (self);
};

func void DIA_Richter_RichtersLakai_ja ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_ja_15_00"); //Niech będzie.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_ja_10_01"); //Doskonale. Ale pamiętaj - jeśli cię złapią, nigdy o mnie nie słyszałeś.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				   KillMorgahard 
// ************************************************************

INSTANCE DIA_Richter_KillMorgahard (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KillMorgahard_Condition;
	information	= DIA_Richter_KillMorgahard_Info;

	description =	"Oto święty młot magów.";
};                       

FUNC INT DIA_Richter_KillMorgahard_Condition()
{
	if (Npc_HasItems (other,Holy_Hammer_MIS))
	&& (MIS_Richter_BringHolyHammer == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KillMorgahard_Info()
{	
	AI_Output (other,self ,"DIA_Richter_KillMorgahard_15_00"); //Oto święty młot magów.
	B_GiveInvItems (other, self, Holy_Hammer_MIS,1);
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_01"); //Jestem pod wrażeniem. Wygląda na to, że faktycznie ci na tym zależy. Oto twoja zapłata.
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_02"); //Dobrze, skoro sprawy tak się mają, to przygotowałem dla ciebie kolejne zadanie.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_03"); //Przed kilkoma dniami grupa opryszków uciekła z tutejszego więzienia.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_04"); //Te sucze syny zwiały i schowały się w górach. Poszli w kierunku nowej wieży Xardasa.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_05"); //Ich przywódcą jest Morgahard. Chcę, żebyś go zabił.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_06"); //Spiesz się, nim zdążą uciec zbyt daleko.
	
	Wld_InsertNpc	(BDT_1030_Morgahard,"REICH"); 
	Wld_InsertNpc	(BDT_1031_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1032_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1033_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1034_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1035_Fluechtling,"REICH"); 

	B_InitNpcGlobals ();

	B_GivePlayerXP (XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry (TOPIC_RichterLakai,"Niektórzy więźniowie zdołali uciec sędziemu. Najprawdopodobniej ukrywają się gdzieś w górach, w okolicy nowej wieży Xardasa. Mam zabić ich przywódcę, Morgaharda. "); 
	MIS_Richter_KillMorgahard = LOG_RUNNING;
	AI_StopProcessInfos (self);
};	

// ************************************************************
// 	  KilledMorgahard 
// ************************************************************

INSTANCE DIA_Richter_KilledMorgahard (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KilledMorgahard_Condition;
	information	= DIA_Richter_KilledMorgahard_Info;

	description =	"Morgahard nie żyje.";
};                       

FUNC INT DIA_Richter_KilledMorgahard_Condition()
{
	if (Npc_IsDead(Morgahard))
	&& (MIS_Richter_KillMorgahard == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KilledMorgahard_Info()
{	
	AI_Output (other,self ,"DIA_Richter_KilledMorgahard_15_00"); //Morgahard nie żyje.
	AI_Output (self ,other,"DIA_Richter_KilledMorgahard_10_01"); //Dobry z ciebie chłopak. Oto twoja nagroda.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);					
	B_GivePlayerXP (XP_KillMorgahard);
	B_LogEntry (TOPIC_RichterLakai,"Sędziego najwyraźniej ucieszyła wiadomość o śmierci Morgaharda. To dobrze, ale muszę pamiętać o zadaniu, które powierzył mi Lee."); 
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};

// ************************************************************
// 	  KilledMorgahardPERM 
// ************************************************************

INSTANCE DIA_Richter_KilledMorgahardPERM (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KilledMorgahardPERM_Condition;
	information	= DIA_Richter_KilledMorgahardPERM_Info;
	permanent	 = 	TRUE;

	description =	"Czy mogę coś jeszcze dla ciebie zrobić?";
};                       

FUNC INT DIA_Richter_KilledMorgahardPERM_Condition()
{
	if (MIS_Richter_KillMorgahard == LOG_SUCCESS)
	&& (MIS_RichtersPermissionForShip == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KilledMorgahardPERM_Info ()
{	
	AI_Output (other,self ,"DIA_Richter_KilledMorgahardPERM_15_00"); //Czy mogę coś jeszcze dla ciebie zrobić?
	AI_Output (self ,other,"DIA_Richter_KilledMorgahardPERM_10_01"); //W tej chwili nie. Może później.
};

// ************************************************************
// 		 PermissionForShip 
// ************************************************************

INSTANCE DIA_Richter_PermissionForShip (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_PermissionForShip_Condition;
	information	= DIA_Richter_PermissionForShip_Info;

	description =	"Daj mi przepustkę na statek paladynów.";
};                       

FUNC INT DIA_Richter_PermissionForShip_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_PermissionForShip_Info ()
{	
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_00"); //Daj mi przepustkę na statek paladynów.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_01"); //Co mam ci dać? Chyba postradałeś zmysły.
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_02"); //Dobrze wiesz, o czym mówię. Daj mi przepustkę albo wydam cię straży.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_03"); //Nie pozwolę się szantażować. A już na pewno nie komuś takiemu jak ty! Każę nakarmić tobą wilki, ty żałosna kupo ścierwa!
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_04"); //Morgahard zamordował gubernatora z twojego rozkazu. Mam dokument, który jednoznacznie to stwierdza.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_05"); //Aaaach.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_06"); //Pożałujesz swoich słów. Nikt nie będzie mnie bezkarnie szantażował.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_07"); //Oto twoja przepustka. Teraz wyjdź. Później się tobą zajmę.
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
	B_LogEntry (TOPIC_Ship,"Dzięki sfałszowanemu dokumentowi dostanie się na statek nie powinno stanowić problemu. Ciekawe, co na to Lee."); 
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP (XP_RichtersPermissionForShip);
};

// ************************************************************
// 		 perm2 
// ************************************************************

INSTANCE DIA_Richter_perm2 (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_perm2_Condition;
	information	= DIA_Richter_perm2_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};                       

FUNC INT DIA_Richter_perm2_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_SUCCESS)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Richter_perm2_Info ()
{	
	AI_Output (self ,other,"DIA_Richter_perm2_10_00"); //Zejdź mi z oczu.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Richter_PICKPOCKET (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 900;
	condition	= DIA_Richter_PICKPOCKET_Condition;
	information	= DIA_Richter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzież tego klucza będzie łatwa)";
};                       

FUNC INT DIA_Richter_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Richter) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Richter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Richter_PICKPOCKET);
	Info_AddChoice		(DIA_Richter_PICKPOCKET, DIALOG_BACK 		,DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Richter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_Richter, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_Richter_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Richter_PICKPOCKET);
};




