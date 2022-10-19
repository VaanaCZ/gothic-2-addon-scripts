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
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_01"); //Jestem Brat Pedro, pokorny s�uga Innosa i od�wierny �wi�tego klasztoru.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_02"); //Co ci� do nas sprowadza?
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
	description = "Masz tu kawa�ek kie�basy, Bracie.";
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
	AI_Output (other, self, "DIA_Pedro_Wurst_15_00"); //Masz tu kawa�ek kie�basy, Bracie.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_01"); //To mi�o, �e o mnie pomy�la�e�. Zwykle nikt o mnie nie pami�ta.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_02"); //M�g�by� mi da� jeszcze kawa�ek...
	AI_Output (other, self, "DIA_Pedro_Wurst_15_03"); //Nie ma mowy. Wtedy za ma�o mi zostanie.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_04"); //No wiesz? Jeden kawa�ek! Przecie� nikt nie zauwa�y. Mog� ci da� co� w zamian! Wiem, gdzie ro�nie sporo ognistych pokrzyw!
	AI_Output (self, other, "DIA_Pedro_Wurst_09_05"); //Je�li zaniesiesz je Neorasowi, na pewno da ci klucz do biblioteki. Co ty na to?
	
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
	Info_AddChoice (DIA_Pedro_Wurst,"Niech b�dzie. Masz jeszcze jedno p�to.",DIA_Pedro_Wurst_JA);
	Info_AddChoice (DIA_Pedro_Wurst,"Nie ma mowy.",DIA_Pedro_Wurst_NEIN);
};
FUNC VOID DIA_Pedro_Wurst_JA()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_JA_15_00"); //Niech b�dzie. Masz jeszcze jedno p�to.
	AI_Output (self, other, "DIA_Pedro_Wurst_JA_09_01"); //�wietnie. Po drugiej stronie mostu, na lewo i na prawo, ro�nie du�o ognistych pokrzyw.
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Info_ClearChoices (DIA_Pedro_Wurst);
	
};
FUNC VOID DIA_Pedro_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_NEIN_15_00"); //Nie ma mowy.
	AI_Output (self, other, "DIA_Pedro_Wurst_NEIN_09_01"); //Chcesz si� podliza� Goraxowi, co? Wszyscy nowicjusze tak robi�...
	
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
	description	= 	"Chc� si� dosta� do klasztoru.";
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
	AI_Output (other, self, "DIA_Pedro_EINLASS_15_00"); //Chc� si� dosta� do klasztoru.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_01"); //Tylko s�udzy Innosa mog� wej�� do �rodka.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_02"); //Je�li chcesz si� pomodli�, poszukaj kt�rej� z przydro�nych kapliczek. Tam r�wnie� znajdziesz odpowiedni� cisz� i spok�j.
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
	description	 = 	"Co mam zrobi�, �eby przyj�to mnie do klasztoru?";
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
 	AI_Output (other, self, "DIA_Pedro_TEMPEL_15_00"); //Co mam zrobi�, �eby przyj�to mnie do klasztoru?
 	
 	if (other.guild != GIL_NONE)
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_01"); //Wybra�e� ju� swoj� �cie�k�. Droga do klasztoru jest przed tob� zamkni�ta.
 	}
 	else
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_02"); //Je�li chcesz do��czy� do Bractwa Innosa, musisz pozna� regu�y klasztoru i wiernie ich przestrzega�.
		//AI_Output (self, other, "DIA_Pedro_TEMPEL_09_03"); //Au�erdem verlangen wir von jedem neuen Novizen die Gaben an Innos. Ein Schaf und ...
		//B_Say_Gold (self, other, Summe_Kloster);  
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_03"); //Wymagamy ponadto od ka�dego nowicjusza daniny na rzecz Innosa.
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_04"); //Owcy i tysi�ca sztuk z�ota.
 		AI_Output (other, self, "DIA_Pedro_TEMPEL_15_04"); //To du�o pieni�dzy.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_05"); //To znak, �e rozpoczynasz nowe �ycie jako s�uga Innosa. Je�li zostaniesz przyj�ty, wszystkie twoje grzechy zostan� ci wybaczone.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_06"); //Ale pami�taj: s�ug� Innosa zostaje si� na ca�e �ycie!
 		SC_KnowsKlosterTribut = TRUE;
  		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Aby zosta� nowicjuszem w klasztorze Innosa, b�d� potrzebowa� owcy i ogromnej sumy pieni�dzy.");
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
	description	 = 	"Mam tu pos��ek...";
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
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_00"); //Mam tu pos��ek - jak s�dz�, powinien si� on znale�� w klasztorze.
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_01"); //Mog� teraz przej��?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_02"); //W tych wyj�tkowych okoliczno�ciach masz zgod� na zostanie nowicjuszem.

		Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Nowicjusz Pedro wpu�ci� mnie do klasztoru, bo przynios�em zaginiony pos��ek. Mam go da� komu� w klasztorze."); 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_03"); //Obawiam si�, �e nawet mimo posiadania tego cennego przedmiotu nie masz tutaj wst�pu.
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_04"); //Wybra�e� inn� �cie�k� rozwoju i droga do klasztoru pozostanie dla ciebie na zawsze zamkni�ta.
	};
};

instance DIA_Addon_Pedro_Statuette_Abgeben (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mog� chocia� zostawi� tutaj ten pos��ek?";
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
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_Abgeben_15_00"); //Mog� chocia� zostawi� tutaj ten pos��ek?
	AI_Output (self, other, "DIA_Addon_Pedro_Statuette_Abgeben_09_01"); //Oczywi�cie, natychmiast si� nim zajm�. Dzi�kuj� ci za bezinteresowne po�wi�cenie.
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
	description	 = 	"Jakich regu� przestrzegaj� s�udzy Innosa?";
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
	AI_Output (other, self,"DIA_Pedro_Rules_15_00"); //Jakich regu� przestrzegaj� s�udzy Innosa?
	AI_Output (self, other,"DIA_Pedro_Rules_09_01"); //Innos jest bogiem prawdy i sprawiedliwo�ci, dlatego pod �adnym pozorem nie wolno nam oszukiwa� i �ama� prawa.
	AI_Output (self, other,"DIA_Pedro_Rules_09_02"); //Wyst�pienie przeciwko kt�remu� z braci lub okradanie klasztoru jest karane z ca�� surowo�ci�!
	AI_Output (self, other,"DIA_Pedro_Rules_09_03"); //Innos jest tak�e bogiem w�adzy i ognia.
	AI_Output (self, other,"DIA_Pedro_Rules_09_04"); //Jako nowicjusz musisz okazywa� szacunek i pos�usze�stwo wszystkim Magom Ognia.
	AI_Output (other,self ,"DIA_Pedro_Rules_15_05"); //Rozumiem.
	AI_Output (self ,other,"DIA_Pedro_Rules_09_06"); //Co wi�cej, obowi�zkiem ka�dego nowicjusza jest praca w klasztorze dla dobra ca�ej spo�eczno�ci.
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Pedro_Rules_09_07"); //Je�li jeste� got�w przestrzega� tych zasad i z�o�ysz odpowiedni� ofiar�, mo�esz zosta� przyj�ty do klasztoru jako nowicjusz.
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
	description	 = 	"Chc� zosta� nowicjuszem.";
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
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Musz� to sobie jeszcze przemy�le�.",DIA_Pedro_AUFNAHME_NO);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Tak, chc� po�wi�ci� swoje �ycie s�u�bie Innosowi.",DIA_Pedro_AUFNAHME_YES);
};
func void DIA_Pedro_AUFNAHME_Info ()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_15_00"); //Chc� zosta� nowicjuszem.
	
	Npc_PerceiveAll (self);
	
	if (hero.guild != GIL_NONE)
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_01"); //Wybra�e� ju� �cie�k�, po kt�rej kroczysz. Droga magii jest dla ciebie zamkni�ta.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	//ADDON>
	else if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
	{
		AI_Output (self, other, "DIA_Addon_Pedro_AUFNAHME_09_02"); //Na pewno tego w�a�nie pragniesz? Wiedz, �e wyb�r �cie�ki rozwoju jest ostateczny i nie b�dziesz go m�g� zmieni�!
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	//<ADDON
	else if (hero.guild == GIL_NONE )
	&& (Npc_HasItems (hero, ItMi_Gold) >= Summe_Kloster)
	&& Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 1000)
	{
		
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_03"); //Widz�, �e got�w jeste� z�o�y� odpowiedni� ofiar�. Je�li nie zmieni�e� zdania, mo�esz teraz zosta� nowicjuszem w klasztorze.
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_04"); //Pami�taj jednak, �e od tej decyzji nie ma odwo�ania. Musisz mie� pewno��, �e wybierasz w�a�ciw� �cie�k�!
		
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	else
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_02"); //Nie masz jeszcze rzeczy potrzebnych do z�o�enia ofiary.
	};
};

FUNC VOID DIA_Pedro_AUFNAHME_YES()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_00"); //Tak, chc� po�wi�ci� swoje �ycie s�u�bie Innosowi.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_01"); //Zatem witaj w�r�d nas, Bracie. Oto klucz do bramy klasztoru.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_02"); //Teraz musisz dobrowolnie otworzy� te odrzwia i przekroczy� pr�g.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_03"); //Od dzi� jeste� nowicjuszem. No� t� szat�, by wszyscy wiedzieli, �e jeste� jednym z nas.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_04"); //W �rodku zg�o� si� do Parlana. Od dzi� on b�dzie si� tob� opiekowa�.
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_05"); //Czy moje wyst�pki zostan� mi zapomniane?
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_06"); //Jeszcze nie. Porozmawiaj z Mistrzem Parlanem. On udzieli ci b�ogos�awie�stwa i oczy�ci z grzech�w.
	
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
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_NO_15_00"); //Musz� to sobie jeszcze przemy�le�.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_NO_09_01"); //Wr��, gdy uznasz, �e jeste� gotowy.
	
	Info_ClearChoices (DIA_Pedro_AUFNAHME);
};
//*********************************************************************
//	Erz�hl mir vom Leben im Kloster.
//*********************************************************************
instance DIA_Pedro_Monastery		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	90;
	condition	 = 	DIA_Pedro_Monastery_Condition;
	information	 = 	DIA_Pedro_Monastery_Info;
	permanent	 = 	TRUE;
	description	 = 	"Opowiedz mi o �yciu w klasztorze.";
};
func int DIA_Pedro_Monastery_Condition ()
{		
	return TRUE;
};
func void DIA_Pedro_Monastery_Info ()
{
	AI_Output (other, self, "DIA_Pedro_Monastery_15_00"); //Opowiedz mi o �yciu w klasztorze.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_01"); //Celem naszego �ycia jest s�u�ba wielkiemu Innosowi. My, nowicjusze, wykonujemy podstawowe prace, a w wolnych chwilach studiujemy stare pisma.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_02"); //Naszymi opiekunami s� magowie, kt�rzy zg��biaj� sztuki tajemne.
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















