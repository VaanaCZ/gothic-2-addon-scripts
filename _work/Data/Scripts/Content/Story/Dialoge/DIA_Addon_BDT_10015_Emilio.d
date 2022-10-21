//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_EXIT   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 999;
	condition   = DIA_Addon_Emilio_EXIT_Condition;
	information = DIA_Addon_Emilio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Emilio_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Emilio_PICKPOCKET (C_INFO)
{
	npc			= BDT_10015_Addon_Emilio;
	nr			= 900;
	condition	= DIA_Addon_Emilio_PICKPOCKET_Condition;
	information	= DIA_Addon_Emilio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Emilio_PICKPOCKET_Condition()
{
	C_Beklauen (76, 112);
};
 
FUNC VOID DIA_Addon_Emilio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Emilio_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Emilio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Emilio_PICKPOCKET_DoIt);
};

func void DIA_Addon_Emilio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
	
func void DIA_Addon_Emilio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Hi   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Hi_Condition;
	information = DIA_Addon_Emilio_Hi_Info;
	permanent   = FALSE;
	description	= "Wygl�dasz jak kopacz.";
};
FUNC INT DIA_Addon_Emilio_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Hi_15_00");//Wygl�dasz jak kopacz.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Hi_10_01");//Bo JESTEM kopaczem. Gdy ostatnio by�em w kopalni, tyra�em jak w�.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//----------------------------------------------------------------------
//	Info Gold
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Gold   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 2;
	condition   = DIA_Addon_Emilio_Gold_Condition;
	information = DIA_Addon_Emilio_Gold_Info;
	permanent   = FALSE;
	description	= "Co si� dzieje ze z�otem z kopalni?";
};
FUNC INT DIA_Addon_Emilio_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Gold_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Gold_15_00");//Co si� dzieje ze z�otem z kopalni?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_01");//Thorus je zbiera i rozprowadza. Nikt nie mo�e zatrzyma� tego, co znajdzie.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_02");//Ka�dy otrzymuje tylko cz�� z�ota, by my�liwi i stra�nicy te� co� mieli.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_03");//To dobrze. Od czasu wprowadzenia tej zasady mamy mniej zabitych, a kopacze i tak dostaj� wi�cej ni� ci z zewn�trz.
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Stein   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 3;
	condition   = DIA_Addon_Emilio_Stein_Condition;
	information = DIA_Addon_Emilio_Stein_Info;
	permanent   = FALSE;
	description	= "O co chodzi z tymi czerwonymi kamieniami?";
};
FUNC INT DIA_Addon_Emilio_Stein_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Stein_15_00");//O co chodzi z tymi czerwonymi kamieniami?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_01");//To pomys� Thorusa i Estebana.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_02");//Thorus zajmuje si� rozprowadzaniem z�ota, a Esteban organizacj� pracy w kopalni.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_03");//Oczywi�cie nie chce mu si� biega� do Thorusa za ka�dym razem, gdy wysy�a kogo� do kopalni.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_04");//Po to s� te czerwone tabliczki - dzi�ki nim Thorus wpuszcza nas do �rodka. To co� jak karta wst�pu.
};
//---------------------------------------------------------------------
//	Info Attentat 
//---------------------------------------------------------------------
var int Emilio_Switch;

INSTANCE DIA_Addon_Emilio_Attentat   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 4;
	condition   = DIA_Addon_Emilio_Attentat_Condition;
	information = DIA_Addon_Emilio_Attentat_Info;
	permanent   = TRUE;
	description	= "Co wiesz o pr�bie zab�jstwa?";
};
FUNC INT DIA_Addon_Emilio_Attentat_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio)) 
	&& (Npc_IsDead (Senyan))
	{
		return FALSE;		//selbe Condition wie 'Hilf mir...'
	}
	else if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
FUNC VOID DIA_Addon_Emilio_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Emilio_Attentat_15_00"); //Co wiesz o pr�bie zab�jstwa?
	if (Emilio_Switch == 0)
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_01"); //Hej, nie mam z tym nic wsp�lnego!
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_02"); //KOMPLETNIE NIC!
		Emilio_Switch = 0;
	};
};

//----------------------------------------------------------------------
//	Info Senyan 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Senyan   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Senyan_Condition;
	information = DIA_Addon_Emilio_Senyan_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Emilio_Senyan_Condition()
{	
	if Npc_IsDead (Senyan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Senyan_Info()
{	
	if (Senyan_Called == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_00");//Powiedz mi, DLACZEGO Senyan zawo�a� "Patrzcie, kogo tu mamy?"
		AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_01");//Chodzi�o o nieuregulowany d�ug.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_02"); //Zabi�e� Senyana!
	};
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_03");//Masz jaki� problem?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_04");//Nie, sk�d, nie mam �adnego problemu.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_05");//Wprost przeciwnie. Ten gnojek pracowa� dla Estebana.
	
	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry (Topic_Addon_Esteban, "Emilio nie stoi po stronie Estebana.");
};

//----------------------------------------------------------------------
//	Info Jetzt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Jetzt   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 5;
	condition   = DIA_Addon_Emilio_Jetzt_Condition;
	information = DIA_Addon_Emilio_Jetzt_Info;
	permanent   = FALSE;
	description	= "Dlaczego nie jeste� teraz w kopalni?";
};
FUNC INT DIA_Addon_Emilio_Jetzt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Jetzt_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_Jetzt_15_00"); //Dlaczego nie jeste� teraz w kopalni?
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_01"); //By�em tam bardzo d�ugo i pracowa�em tak ci�ko, �e prawie odpad�y mi r�ce. Potrzebuj� kilku dni odpoczynku.
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_02"); //Potem wezm� sw�j kolejny czerwony kamie�.
};

//----------------------------------------------------------------------
//	Info VonEmilio
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_VonEmilio (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 6;
	condition   = DIA_Addon_Emilio_VonEmilio_Condition;
	information = DIA_Addon_Emilio_VonEmilio_Info;
	permanent   = FALSE;
	description	= "Lennar powiedzia� mi o tobie kilka ciekawych rzeczy....";
};
FUNC INT DIA_Addon_Emilio_VonEmilio_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt))
	&& (Npc_KnowsInfo (other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_VonEmilio_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_00"); //Lennar powiedzia� mi o tobie kilka ciekawych rzeczy....
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_01"); //Lennar? Ten go�� to idiota! Na pewno to zauwa�y�e�.
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_02"); //Powiedzia�, �e nie by�e� w kopalni od czasu pr�by zab�jstwa.
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_03"); //Nn... Nic nie wiem!
	
	if (!Npc_IsDead (Senyan))
	{	
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_04"); //Zm�wi�e� si� z Senyanem, tak?
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_05"); //Jeste�cie w zmowie z Estebanem! S�ysza�em, o czym gadali�cie!
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_06"); //Esteban ma nas gdzie�. Dlaczego mam ufa� jego ludziom?
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_07"); //Zostaw mnie w spokoju!
		AI_StopProcessInfos(self);
	};
	B_LogEntry (Topic_Addon_Esteban, "Emilio uwa�a Lennara za idiot�.");
};
//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_HilfMir (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 7;
	condition   = DIA_Addon_Emilio_HilfMir_Condition;
	information = DIA_Addon_Emilio_HilfMir_Info;
	permanent   = FALSE;
	description	= "Pom� mi znale�� kolesia, kt�ry zorganizowa� pr�b� zab�jstwa!";
};
FUNC INT DIA_Addon_Emilio_HilfMir_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio))
	&& (Npc_IsDead (Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_HilfMir_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_00"); //Pom� mi znale�� cz�owieka, kt�ry zorganizowa� pr�b� zab�jstwa!
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_01"); //Nie! Nie chc� mie� z tym nic wsp�lnego!
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_02"); //Je�eli taki idiota, jak Lennar, zauwa�y� twoje dziwne zachowanie, Esteban szybko co� zw�cha.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_03"); //Ja... Cholera! Podam ci tylko imi�. Nie powiem nic wi�cej.
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_04"); //S�ucham.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_05"); //Huno, id� do Huno. On musi co� wiedzie�.
	Emilio_TellAll = TRUE;
	
	B_LogEntry (Topic_Addon_Esteban, "Emilio w ko�cu wykrztusi� imi�: Huno.");
};

//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_GegenEsteban (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 8;
	condition   = DIA_Addon_Emilio_GegenEsteban_Condition;
	information = DIA_Addon_Emilio_GegenEsteban_Info;
	permanent   = FALSE;
	description	= "Jaki masz problem z Estebanem?";
};
FUNC INT DIA_Addon_Emilio_GegenEsteban_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_GegenEsteban_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_GegenEsteban_15_00"); //Jaki masz problem z Estebanem?
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_01"); //Ta �winia my�li tylko o pieni�dzach.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_02"); //Co kilka dni kto� zostaje po�arty przez pe�zacza.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_03"); //Ale Esteban nie chce wys�a� do kopalni wojownik�w.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_04"); //A dlaczego? Bo ci kolesie stanowi� cz�� Stra�y Kruka, a on boi si� im rozkazywa�.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_05"); //Zamiast tego pozwala nam zdycha�!
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Mine   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Mine_Condition;
	information = DIA_Addon_Emilio_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Emilio_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Mine_10_00");//Wi�c teraz ty tu jeste� szefem. W takim razie ruszam w swoj� drog�.
	
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
	
	
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Hacker   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Hacker_Condition;
	information = DIA_Addon_Emilio_Hacker_Info;
	permanent   = TRUE;
	Description = "Co nowego?"; 
};
FUNC INT DIA_Addon_Emilio_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Emilio_Hacker_15_00"); //Co nowego?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Emilio_Hacker_10_01"); //Ci�ko pracuj�, ale nie zostan� po�arty przez pe�zacza.
};




