//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Joe_EXIT   (C_INFO)
{
	npc         = VLK_448_Joe;
	nr          = 999;
	condition   = DIA_Joe_EXIT_Condition;
	information = DIA_Joe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Joe_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Joe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Joe_PICKPOCKET (C_INFO)
{
	npc			= VLK_448_Joe;
	nr			= 900;
	condition	= DIA_Joe_PICKPOCKET_Condition;
	information	= DIA_Joe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Joe_PICKPOCKET_Condition()
{
	C_Beklauen (25, 25);
};
 
FUNC VOID DIA_Joe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Joe_PICKPOCKET);
	Info_AddChoice		(DIA_Joe_PICKPOCKET, DIALOG_BACK 		,DIA_Joe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Joe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Joe_PICKPOCKET_DoIt);
};

func void DIA_Joe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Joe_PICKPOCKET);
};
	
func void DIA_Joe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Joe_PICKPOCKET);
};
//////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Joe_Hallo   (C_INFO)
{
	npc         = VLK_448_Joe;
	nr          = 2;
	condition   = DIA_Joe_Hallo_Condition;
	information = DIA_Joe_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE; 
};
FUNC INT DIA_Joe_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Joe_Hallo_Info()
{
	AI_Output (self, other,"DIA_Joe_Hallo_10_00");//Hej, dzi�ki, cz�owieku! Naprawd� wielkie dzi�ki. Ju� my�la�em, �e nigdy si� st�d nie wydostan�...
	TOPIC_END_Joe = TRUE;
	B_GivePlayerXP ((XP_Ambient*4));
	
	AI_Output (other, self,"DIA_Joe_Hallo_15_01");//Co ty TUTAJ robisz?
	AI_Output (self, other,"DIA_Joe_Hallo_10_02");//Da�em si� zamkn��. Drzwi by�y otwarte i chcia�em si� jedynie troch� rozejrze�, ale kiedy tylko wszed�em do �rodka, pojawi�a si� stra� i zamkn�a te cholerne drzwi.
	AI_Output (self, other,"DIA_Joe_Hallo_10_03");//To do�� kr�puj�ca sytuacja. By�bym bardzo wdzi�czny, gdyby pozosta�o to mi�dzy nami.
	AI_Output (other, self,"DIA_Joe_Hallo_15_04");//Rozumiem, to rzeczywi�cie nie jest pow�d do dumy.
	AI_Output (self, other,"DIA_Joe_Hallo_10_05");//Chyba musz� si� napi�.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START"); 
};
//////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Joe_Perm   (C_INFO)
{
	npc         = VLK_448_Joe;
	nr          = 2;
	condition   = DIA_Joe_Perm_Condition;
	information = DIA_Joe_Perm_Info;
	permanent   = TRUE;
	description	= "Wszystko w porz�dku?";
};
FUNC INT DIA_Joe_Perm_Condition()
{	
	if (Npc_GetDistToWP (self,"NW_CITY_HABOUR_TAVERN01_08") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Joe_Perm_Info()
{
	AI_Output (other, self,"DIA_Joe_Perm_15_00");//Wszystko w porz�dku?
	AI_Output (self, other,"DIA_Joe_Perm_10_01");//Dzi�ki za uwolnienie.
	
	AI_StopProcessInfos (self);
};
//////////////////////////////////////////////////////////////////////
//	Info Sign
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Joe_Sign   (C_INFO)
{
	npc         = VLK_448_Joe;
	nr          = 2;
	condition   = DIA_Joe_Sign_Condition;
	information = DIA_Joe_Sign_Info;
	permanent   = FALSE;
	description	= "(Poka� z�odziejski gest)";
};
FUNC INT DIA_Joe_Sign_Condition()
{	
	if (Npc_GetDistToWP (self,"NW_CITY_HABOUR_TAVERN01_08") <= 500)
	&& (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Joe_Sign_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other,"DIA_Joe_Sign_10_00");//Hej, wiesz co - mamy wsp�lnych znajomych. W takim razie pozw�l mi wyrazi� wdzi�czno�� za uratowanie.
	AI_Output (self, other,"DIA_Joe_Sign_10_01");//Prosz�, we� te wytrychy. Na pewno ci si� przydadz�.
	
	B_GiveInvItems (self, other, ItKE_Lockpick, 5);
	
	AI_StopProcessInfos (self);
};

 
 
