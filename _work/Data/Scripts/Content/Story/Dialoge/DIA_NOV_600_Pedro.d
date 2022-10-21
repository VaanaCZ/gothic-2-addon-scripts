///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro;
	nr          = 999;
	condition   = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_WELCOME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 =  1;
	condition	 = 	DIA_Pedro_WELCOME_Condition;
	information	 = 	DIA_Pedro_WELCOME_Info;
	important	 = 	TRUE;
};
func int DIA_Pedro_WELCOME_Condition ()
{
	return TRUE;
};
func void DIA_Pedro_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_00"); //Witaj w klasztorze Innosa, nieznajomy.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_01"); //Jestem Brat Pedro, pokorny s³uga Innosa i odŸwierny œwiêtego klasztoru.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_02"); //Co ciê do nas sprowadza?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Pedro_Wurst(C_INFO)
{
	npc         = NOV_600_Pedro;
	nr			= 2;
	condition	= DIA_Pedro_Wurst_Condition;
	information	= DIA_Pedro_Wurst_Info;
	permanent	= FALSE;
	description = "Masz tu kawa³ek kie³basy, Bracie.";
};                       

FUNC INT DIA_Pedro_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pedro_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Pedro_Wurst_15_00"); //Masz tu kawa³ek kie³basy, Bracie.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_01"); //To mi³o, ¿e o mnie pomyœla³eœ. Zwykle nikt o mnie nie pamiêta.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_02"); //Móg³byœ mi daæ jeszcze kawa³ek...
	AI_Output (other, self, "DIA_Pedro_Wurst_15_03"); //Nie ma mowy. Wtedy za ma³o mi zostanie.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_04"); //No wiesz? Jeden kawa³ek! Przecie¿ nikt nie zauwa¿y. Mogê ci daæ coœ w zamian! Wiem, gdzie roœnie sporo ognistych pokrzyw!
	AI_Output (self, other, "DIA_Pedro_Wurst_09_05"); //Jeœli zaniesiesz je Neorasowi, na pewno da ci klucz do biblioteki. Co ty na to?
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Pedro_Wurst);
	Info_AddChoice (DIA_Pedro_Wurst,"Niech bêdzie. Masz jeszcze jedno pêto.",DIA_Pedro_Wurst_JA);
	Info_AddChoice (DIA_Pedro_Wurst,"Nie ma mowy.",DIA_Pedro_Wurst_NEIN);
};
FUNC VOID DIA_Pedro_Wurst_JA()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_JA_15_00"); //Niech bêdzie. Masz jeszcze jedno pêto.
	AI_Output (self, other, "DIA_Pedro_Wurst_JA_09_01"); //Œwietnie. Po drugiej stronie mostu, na lewo i na prawo, roœnie du¿o ognistych pokrzyw.
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Info_ClearChoices (DIA_Pedro_Wurst);
	
};
FUNC VOID DIA_Pedro_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_NEIN_15_00"); //Nie ma mowy.
	AI_Output (self, other, "DIA_Pedro_Wurst_NEIN_09_01"); //Chcesz siê podlizaæ Goraxowi, co? Wszyscy nowicjusze tak robi¹...
	
	Info_ClearChoices (DIA_Pedro_Wurst);
};
///////////////////////////////////////////////////////////////////////
//	Info EINLASS
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_EINLASS		(C_INFO)
{
	npc			= 	NOV_600_Pedro;
	condition	= 	DIA_Pedro_EINLASS_Condition;
	information	= 	DIA_Pedro_EINLASS_Info;
	permanent	=	FALSE;
	description	= 	"Chcê siê dostaæ do klasztoru.";
};
func int DIA_Pedro_EINLASS_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Pedro_Welcome)
	{
		return TRUE;
	};
};
func void DIA_Pedro_EINLASS_Info ()
{
	AI_Output (other, self, "DIA_Pedro_EINLASS_15_00"); //Chcê siê dostaæ do klasztoru.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_01"); //Tylko s³udzy Innosa mog¹ wejœæ do œrodka.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_02"); //Jeœli chcesz siê pomodliæ, poszukaj którejœ z przydro¿nych kapliczek. Tam równie¿ znajdziesz odpowiedni¹ ciszê i spokój.
};
///////////////////////////////////////////////////////////////////////
//	Info TEMPEL
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_TEMPEL		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_TEMPEL_Condition;
	information	 = 	DIA_Pedro_TEMPEL_Info;
	permanent 	 =  FALSE;
	description	 = 	"Co mam zrobiæ, ¿eby przyjêto mnie do klasztoru?";
};
//-----------------------------------

//-----------------------------------
func int DIA_Pedro_TEMPEL_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Pedro_EINLASS))
	&& (hero.guild != GIL_NOV)
	{	
		return TRUE;
	};	
};
func void DIA_Pedro_TEMPEL_Info ()
{	
 	AI_Output (other, self, "DIA_Pedro_TEMPEL_15_00"); //Co mam zrobiæ, ¿eby przyjêto mnie do klasztoru?
 	
 	if (other.guild != GIL_NONE)
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_01"); //Wybra³eœ ju¿ swoj¹ œcie¿kê. Droga do klasztoru jest przed tob¹ zamkniêta.
 	}
 	else
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_02"); //Jeœli chcesz do³¹czyæ do Bractwa Innosa, musisz poznaæ regu³y klasztoru i wiernie ich przestrzegaæ.
		//AI_Output (self, other, "DIA_Pedro_TEMPEL_09_03"); //Außerdem verlangen wir von jedem neuen Novizen die Gaben an Innos. Ein Schaf und ...
		//B_Say_Gold (self, other, Summe_Kloster);  
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_03"); //Wymagamy ponadto od ka¿dego nowicjusza daniny na rzecz Innosa.
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_04"); //Owcy i tysi¹ca sztuk z³ota.
 		AI_Output (other, self, "DIA_Pedro_TEMPEL_15_04"); //To du¿o pieniêdzy.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_05"); //To znak, ¿e rozpoczynasz nowe ¿ycie jako s³uga Innosa. Jeœli zostaniesz przyjêty, wszystkie twoje grzechy zostan¹ ci wybaczone.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_06"); //Ale pamiêtaj: s³ug¹ Innosa zostaje siê na ca³e ¿ycie!
 		SC_KnowsKlosterTribut = TRUE;
  		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Aby zostaæ nowicjuszem w klasztorze Innosa, bêdê potrzebowa³ owcy i ogromnej sumy pieniêdzy.");
 	};
};

//*********************************************************************
//	ADDON Statuette
//*********************************************************************
instance DIA_Addon_Pedro_Statuette (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mam tu pos¹¿ek...";
};
func int DIA_Addon_Pedro_Statuette_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Pedro_Rules))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_00"); //Mam tu pos¹¿ek - jak s¹dzê, powinien siê on znaleŸæ w klasztorze.
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_01"); //Mogê teraz przejœæ?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_02"); //W tych wyj¹tkowych okolicznoœciach masz zgodê na zostanie nowicjuszem.

		Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Nowicjusz Pedro wpuœci³ mnie do klasztoru, bo przynios³em zaginiony pos¹¿ek. Mam go daæ komuœ w klasztorze."); 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_03"); //Obawiam siê, ¿e nawet mimo posiadania tego cennego przedmiotu nie masz tutaj wstêpu.
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_04"); //Wybra³eœ inn¹ œcie¿kê rozwoju i droga do klasztoru pozostanie dla ciebie na zawsze zamkniêta.
	};
};

instance DIA_Addon_Pedro_Statuette_Abgeben (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mogê chocia¿ zostawiæ tutaj ten pos¹¿ek?";
};
func int DIA_Addon_Pedro_Statuette_Abgeben_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (Npc_KnowsInfo (other,DIA_Addon_Pedro_Statuette))
	&& (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_Abgeben_15_00"); //Mogê chocia¿ zostawiæ tutaj ten pos¹¿ek?
	AI_Output (self, other, "DIA_Addon_Pedro_Statuette_Abgeben_09_01"); //Oczywiœcie, natychmiast siê nim zajmê. Dziêkujê ci za bezinteresowne poœwiêcenie.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};
///////////////////////////////////////////////////////////////////////
//	Regeln
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_Rules		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_Rules_Condition;
	information	 = 	DIA_Pedro_Rules_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jakich regu³ przestrzegaj¹ s³udzy Innosa?";
};
func int DIA_Pedro_Rules_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Pedro_Tempel)
	{
		return TRUE;
	};
};
func void DIA_Pedro_Rules_Info ()
{
	AI_Output (other, self,"DIA_Pedro_Rules_15_00"); //Jakich regu³ przestrzegaj¹ s³udzy Innosa?
	AI_Output (self, other,"DIA_Pedro_Rules_09_01"); //Innos jest bogiem prawdy i sprawiedliwoœci, dlatego pod ¿adnym pozorem nie wolno nam oszukiwaæ i ³amaæ prawa.
	AI_Output (self, other,"DIA_Pedro_Rules_09_02"); //Wyst¹pienie przeciwko któremuœ z braci lub okradanie klasztoru jest karane z ca³¹ surowoœci¹!
	AI_Output (self, other,"DIA_Pedro_Rules_09_03"); //Innos jest tak¿e bogiem w³adzy i ognia.
	AI_Output (self, other,"DIA_Pedro_Rules_09_04"); //Jako nowicjusz musisz okazywaæ szacunek i pos³uszeñstwo wszystkim Magom Ognia.
	AI_Output (other,self ,"DIA_Pedro_Rules_15_05"); //Rozumiem.
	AI_Output (self ,other,"DIA_Pedro_Rules_09_06"); //Co wiêcej, obowi¹zkiem ka¿dego nowicjusza jest praca w klasztorze dla dobra ca³ej spo³ecznoœci.
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Pedro_Rules_09_07"); //Jeœli jesteœ gotów przestrzegaæ tych zasad i z³o¿ysz odpowiedni¹ ofiarê, mo¿esz zostaæ przyjêty do klasztoru jako nowicjusz.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_AUFNAHME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	condition	 = 	DIA_Pedro_AUFNAHME_Condition;
	information	 = 	DIA_Pedro_AUFNAHME_Info;
	permanent 	 =  TRUE; 
	description	 = 	"Chcê zostaæ nowicjuszem.";
};
var int DIA_Pedro_AUFNAHME_NOPERM;
func int DIA_Pedro_AUFNAHME_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pedro_Rules)
	&& (DIA_Pedro_AUFNAHME_NOPERM == FALSE)
	{
		return TRUE;
	};
};
func void B_DIA_Pedro_AUFNAHME_Choice ()
{
		Info_ClearChoices (DIA_Pedro_AUFNAHME);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Muszê to sobie jeszcze przemyœleæ.",DIA_Pedro_AUFNAHME_NO);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Tak, chcê poœwiêciæ swoje ¿ycie s³u¿bie Innosowi.",DIA_Pedro_AUFNAHME_YES);
};
func void DIA_Pedro_AUFNAHME_Info ()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_15_00"); //Chcê zostaæ nowicjuszem.
	
	Npc_PerceiveAll (self);
	
	if (hero.guild != GIL_NONE)
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_01"); //Wybra³eœ ju¿ œcie¿kê, po której kroczysz. Droga magii jest dla ciebie zamkniêta.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	//ADDON>
	else if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
	{
		AI_Output (self, other, "DIA_Addon_Pedro_AUFNAHME_09_02"); //Na pewno tego w³aœnie pragniesz? Wiedz, ¿e wybór œcie¿ki rozwoju jest ostateczny i nie bêdziesz go móg³ zmieniæ!
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	//<ADDON
	else if (hero.guild == GIL_NONE )
	&& (Npc_HasItems (hero, ItMi_Gold) >= Summe_Kloster)
	&& Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 1000)
	{
		
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_03"); //Widzê, ¿e gotów jesteœ z³o¿yæ odpowiedni¹ ofiarê. Jeœli nie zmieni³eœ zdania, mo¿esz teraz zostaæ nowicjuszem w klasztorze.
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_04"); //Pamiêtaj jednak, ¿e od tej decyzji nie ma odwo³ania. Musisz mieæ pewnoœæ, ¿e wybierasz w³aœciw¹ œcie¿kê!
		
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	else
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_02"); //Nie masz jeszcze rzeczy potrzebnych do z³o¿enia ofiary.
	};
};

FUNC VOID DIA_Pedro_AUFNAHME_YES()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_00"); //Tak, chcê poœwiêciæ swoje ¿ycie s³u¿bie Innosowi.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_01"); //Zatem witaj wœród nas, Bracie. Oto klucz do bramy klasztoru.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_02"); //Teraz musisz dobrowolnie otworzyæ te odrzwia i przekroczyæ próg.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_03"); //Od dziœ jesteœ nowicjuszem. Noœ tê szatê, by wszyscy wiedzieli, ¿e jesteœ jednym z nas.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_04"); //W œrodku zg³oœ siê do Parlana. Od dziœ on bêdzie siê tob¹ opiekowa³.
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_05"); //Czy moje wystêpki zostan¹ mi zapomniane?
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_06"); //Jeszcze nie. Porozmawiaj z Mistrzem Parlanem. On udzieli ci b³ogos³awieñstwa i oczyœci z grzechów.
	
	CreateInvItems 		(self,ItKe_Innos_MIS,1);
	B_GiveInvItems 		(self, hero, ItKe_Innos_MIS,1); 
	
	CreateInvItems 		(other,ITAR_NOV_L,1);
	AI_EquipArmor		(other,ITAR_NOV_L);		   
	
	other.guild = GIL_NOV;
	Npc_SetTrueGuild (other, GIL_NOV);
	
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP (XP_AufnahmeNovize);
	
	//ADDON>
 	if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
 	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE; //Joly: nix mehr mit Liesel
	};
	//ADDON<
	
	Wld_AssignRoomToGuild ("Kloster02",GIL_KDF);
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pedro_AUFNAHME_NO()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_NO_15_00"); //Muszê to sobie jeszcze przemyœleæ.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_NO_09_01"); //Wróæ, gdy uznasz, ¿e jesteœ gotowy.
	
	Info_ClearChoices (DIA_Pedro_AUFNAHME);
};
//*********************************************************************
//	Erzähl mir vom Leben im Kloster.
//*********************************************************************
instance DIA_Pedro_Monastery		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	90;
	condition	 = 	DIA_Pedro_Monastery_Condition;
	information	 = 	DIA_Pedro_Monastery_Info;
	permanent	 = 	TRUE;
	description	 = 	"Opowiedz mi o ¿yciu w klasztorze.";
};
func int DIA_Pedro_Monastery_Condition ()
{		
	return TRUE;
};
func void DIA_Pedro_Monastery_Info ()
{
	AI_Output (other, self, "DIA_Pedro_Monastery_15_00"); //Opowiedz mi o ¿yciu w klasztorze.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_01"); //Celem naszego ¿ycia jest s³u¿ba wielkiemu Innosowi. My, nowicjusze, wykonujemy podstawowe prace, a w wolnych chwilach studiujemy stare pisma.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_02"); //Naszymi opiekunami s¹ magowie, którzy zg³êbiaj¹ sztuki tajemne.
}; 




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pedro_PICKPOCKET (C_INFO)
{
	npc			= NOV_600_Pedro;
	nr			= 900;
	condition	= DIA_Pedro_PICKPOCKET_Condition;
	information	= DIA_Pedro_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Pedro_PICKPOCKET_Condition()
{
	C_Beklauen (45, 60);
};
 
FUNC VOID DIA_Pedro_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pedro_PICKPOCKET);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_BACK 		,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};
	
func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};















