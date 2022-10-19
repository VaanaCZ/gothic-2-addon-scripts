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
	AI_Output (other,self ,"DIA_Richter_Hello_15_00"); //Czym si� zajmujesz?
	AI_Output (self ,other,"DIA_Richter_Hello_10_01"); //A jak ci si� wydaje? Kim ty w�a�ciwie jeste�?
	AI_Output (other,self ,"DIA_Richter_Hello_15_02"); //Ja, em...
	AI_Output (self ,other,"DIA_Richter_Hello_10_03"); //S�uchaj no, czy ja ci� sk�d� nie znam?
	
	Info_ClearChoices (DIA_Richter_Hello);
	Info_AddChoice (DIA_Richter_Hello,"Nie przypominam sobie.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice (DIA_Richter_Hello,"Mo�liwe.",DIA_Richter_Hello_MayBe);
};

FUNC VOID DIA_Richter_Hello_DontThinkSo ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_DontThinkSo_15_00"); //Nie przypominam sobie.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_01"); //To zabawne. M�g�bym przysi�c, �e�my si� ju� spotkali.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_02"); //Niewa�ne, pewnie jeste� jak�� szumowin� z rynsztoka. Wszyscy wygl�dacie tak samo.
};

FUNC VOID DIA_Richter_Hello_MayBe ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_MayBe_15_00"); //Mo�liwe.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_01"); //Nie wym�drzaj si�. Nie rozmawiasz z byle kim.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_02"); //M�g�by� przynajmniej zwraca� si� do mnie z nale�nym szacunkiem.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_03"); //A teraz, zejd� mi z oczu.
	
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
	description = "Co s�ycha�?";
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
		AI_Output (self ,other,"DIA_Richter_Perm_10_01"); //Lepiej odejd�, cuchn�cy najemniku, zanim wezw� stra�e.
		AI_Output (other,self ,"DIA_Richter_Perm_15_02"); //Uspok�j si�. Nie przyszed�em tu, by ci� okrada�. Szukam pracy.
		AI_Output (self ,other,"DIA_Richter_Perm_10_03"); //Ach, wi�c chcesz dla mnie pracowa�. To zupe�nie zmienia posta� rzeczy.
		AI_Output (self ,other,"DIA_Richter_Perm_10_04"); //Jest tylko jeden ma�y problem. Nie wiem, czy mog� ci zaufa�. Musisz dowie�� swojej lojalno�ci.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_05"); //Czy� nie powiedzia�em jasno, �e nie chc� by� niepokojony?
		AI_Output (other,self ,"DIA_Richter_Perm_15_06"); //Widocznie co� przeoczy�em.
		AI_Output (self ,other,"DIA_Richter_Perm_10_07"); //Mam wi�c nadziej�, �e teraz to do ciebie dotrze.
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

	description = "Poddaj mnie pr�bie.";
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
	AI_Output (other,self ,"DIA_Richter_RichtersLakai_15_00"); //Poddaj mnie pr�bie.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_01"); //Mmm. Dobrze, pos�uchaj. Przynie� mi �wi�ty m�ot Mag�w Ognia. Trzymaj� go gdzie� w klasztornych piwnicach.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_02"); //Je�li ci si� to uda, zatrudni� ci� jako ochroniarza.
	
	Info_ClearChoices	(DIA_Richter_RichtersLakai);
	Info_AddChoice	(DIA_Richter_RichtersLakai, "Mam okra�� mag�w? Czy� ty na g�ow� upad�?", DIA_Richter_RichtersLakai_nein );
	Info_AddChoice	(DIA_Richter_RichtersLakai, "W porz�dku.", DIA_Richter_RichtersLakai_ja );
	
	B_LogEntry (TOPIC_RichterLakai,"S�dzia mi nie ufa. Musz� udowodni� swoj� lojalno��. W tym celu mam ukra�� �wi�ty m�ot z podziemi klasztoru Mag�w Ognia i zanie�� go s�dziemu."); 

	MIS_Richter_BringHolyHammer = LOG_RUNNING;
};
func void DIA_Richter_RichtersLakai_nein ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_nein_15_00"); //Mam okra�� mag�w? Czy� ty na g�ow� upad�?
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_nein_10_01"); //W takim razie, id� do diab�a i nie marnuj mojego czasu.
	AI_StopProcessInfos (self);
};

func void DIA_Richter_RichtersLakai_ja ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_ja_15_00"); //Niech b�dzie.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_ja_10_01"); //Doskonale. Ale pami�taj - je�li ci� z�api�, nigdy o mnie nie s�ysza�e�.
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

	description =	"Oto �wi�ty m�ot mag�w.";
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
	AI_Output (other,self ,"DIA_Richter_KillMorgahard_15_00"); //Oto �wi�ty m�ot mag�w.
	B_GiveInvItems (other, self, Holy_Hammer_MIS,1);
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_01"); //Jestem pod wra�eniem. Wygl�da na to, �e faktycznie ci na tym zale�y. Oto twoja zap�ata.
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_02"); //Dobrze, skoro sprawy tak si� maj�, to przygotowa�em dla ciebie kolejne zadanie.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_03"); //Przed kilkoma dniami grupa opryszk�w uciek�a z tutejszego wi�zienia.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_04"); //Te sucze syny zwia�y i schowa�y si� w g�rach. Poszli w kierunku nowej wie�y Xardasa.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_05"); //Ich przyw�dc� jest Morgahard. Chc�, �eby� go zabi�.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_06"); //Spiesz si�, nim zd��� uciec zbyt daleko.
	
	Wld_InsertNpc	(BDT_1030_Morgahard,"REICH"); 
	Wld_InsertNpc	(BDT_1031_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1032_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1033_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1034_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1035_Fluechtling,"REICH"); 

	B_InitNpcGlobals ();

	B_GivePlayerXP (XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry (TOPIC_RichterLakai,"Niekt�rzy wi�niowie zdo�ali uciec s�dziemu. Najprawdopodobniej ukrywaj� si� gdzie� w g�rach, w okolicy nowej wie�y Xardasa. Mam zabi� ich przyw�dc�, Morgaharda. "); 
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

	description =	"Morgahard nie �yje.";
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
	AI_Output (other,self ,"DIA_Richter_KilledMorgahard_15_00"); //Morgahard nie �yje.
	AI_Output (self ,other,"DIA_Richter_KilledMorgahard_10_01"); //Dobry z ciebie ch�opak. Oto twoja nagroda.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);					
	B_GivePlayerXP (XP_KillMorgahard);
	B_LogEntry (TOPIC_RichterLakai,"S�dziego najwyra�niej ucieszy�a wiadomo�� o �mierci Morgaharda. To dobrze, ale musz� pami�ta� o zadaniu, kt�re powierzy� mi Lee."); 
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

	description =	"Czy mog� co� jeszcze dla ciebie zrobi�?";
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
	AI_Output (other,self ,"DIA_Richter_KilledMorgahardPERM_15_00"); //Czy mog� co� jeszcze dla ciebie zrobi�?
	AI_Output (self ,other,"DIA_Richter_KilledMorgahardPERM_10_01"); //W tej chwili nie. Mo�e p�niej.
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

	description =	"Daj mi przepustk� na statek paladyn�w.";
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
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_00"); //Daj mi przepustk� na statek paladyn�w.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_01"); //Co mam ci da�? Chyba postrada�e� zmys�y.
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_02"); //Dobrze wiesz, o czym m�wi�. Daj mi przepustk� albo wydam ci� stra�y.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_03"); //Nie pozwol� si� szanta�owa�. A ju� na pewno nie komu� takiemu jak ty! Ka�� nakarmi� tob� wilki, ty �a�osna kupo �cierwa!
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_04"); //Morgahard zamordowa� gubernatora z twojego rozkazu. Mam dokument, kt�ry jednoznacznie to stwierdza.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_05"); //Aaaach.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_06"); //Po�a�ujesz swoich s��w. Nikt nie b�dzie mnie bezkarnie szanta�owa�.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_07"); //Oto twoja przepustka. Teraz wyjd�. P�niej si� tob� zajm�.
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
	B_LogEntry (TOPIC_Ship,"Dzi�ki sfa�szowanemu dokumentowi dostanie si� na statek nie powinno stanowi� problemu. Ciekawe, co na to Lee."); 
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
	AI_Output (self ,other,"DIA_Richter_perm2_10_00"); //Zejd� mi z oczu.
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
	description = "(Kradzie� tego klucza b�dzie �atwa)";
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




