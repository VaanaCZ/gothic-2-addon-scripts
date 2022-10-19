// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Gaertner_EXIT(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 999;
	condition	= DIA_Gaertner_EXIT_Condition;
	information	= DIA_Gaertner_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gaertner_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gaertner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Gaertner_PICKPOCKET (C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 900;
	condition	= DIA_Gaertner_PICKPOCKET_Condition;
	information	= DIA_Gaertner_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Gaertner_PICKPOCKET_Condition()
{
	C_Beklauen (40, 50);
};
 
FUNC VOID DIA_Gaertner_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gaertner_PICKPOCKET);
	Info_AddChoice		(DIA_Gaertner_PICKPOCKET, DIALOG_BACK 		,DIA_Gaertner_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gaertner_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gaertner_PICKPOCKET_DoIt);
};

func void DIA_Gaertner_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gaertner_PICKPOCKET);
};
	
func void DIA_Gaertner_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gaertner_PICKPOCKET);
};
//*************************************************************
//		Was machst du hier?
//*************************************************************
INSTANCE DIA_Gaertner_Job(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 5;
	condition	= DIA_Gaertner_Job_Condition;
	information	= DIA_Gaertner_Job_Info;
	permanent	= FALSE;
	description = "Co tu porabiasz?";
};                       

FUNC INT DIA_Gaertner_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gaertner_Job_Info()
{	
	AI_Output (other,self ,"DIA_Gaertner_Job_15_00"); //Co tutaj robisz?
	AI_Output (self ,other,"DIA_Gaertner_Job_09_01"); //A jak s�dzisz, h�? Jestem ogrodnikiem, zajmuj� si� ogrodem.
	AI_Output (other,self ,"DIA_Gaertner_Job_15_02"); //Nie masz tu zbyt wiele towarzystwa, co?
	AI_Output (self ,other,"DIA_Gaertner_Job_09_03"); //Nie, i dobrze mi z tym. Przynajmniej mam spok�j.
	AI_Output (self ,other,"DIA_Gaertner_Job_09_04"); //Raz chcieli mnie wpakowa� do Kolonii za zab�jstwo jednego go�cia.
	AI_Output (self ,other,"DIA_Gaertner_Job_09_05"); //Ale poniewa� gubernator Larius potrzebowa� ogrodnika, pozwolili mi tu zosta�.
	AI_Output (self ,other,"DIA_Gaertner_Job_09_06"); //Z czasem ten ogr�d sta� si� moim domem. Bardzo si� ciesz�, �e tak si� sta�o.
};
//*************************************************************
//		
//*************************************************************
INSTANCE DIA_Gaertner_Plants(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 5;
	condition	= DIA_Gaertner_Plants_Condition;
	information	= DIA_Gaertner_Plants_Info;
	permanent	= FALSE;
	description = "Czy hodujesz r�wnie� jakie� zio�a?";
};                       

FUNC INT DIA_Gaertner_Plants_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Gaertner_Job)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gaertner_Plants_Info()
{	
	AI_Output (other,self ,"DIA_Gaertner_Plants_15_00"); //Czy hodujesz r�wnie� jakie� zio�a?
	AI_Output (self ,other,"DIA_Gaertner_Plants_09_01"); //Nawet kilka. Mam tutaj ogniste ziele i ogniste pokrzywy. Pr�bowa�em te� hodowa� bagienne ziele, ale nie za bardzo chce rosn�� w tych warunkach.
	AI_Output (self ,other,"DIA_Gaertner_Plants_09_02"); //Mam troch� �wie�o �ci�tych ro�lin, wi�c gdyby� chcia� co� kupi�...
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Ogrodnik gubernatora mo�e mi sprzeda� ro�liny.");
};
//*************************************************************
//		Trade
//*************************************************************
INSTANCE DIA_Gaertner_Trade(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 5;
	condition	= DIA_Gaertner_Trade_Condition;
	information	= DIA_Gaertner_Trade_Info;
	permanent	= TRUE;
	description = "Poka� mi swoje towary.";
	trade		= TRUE;
};                       

FUNC INT DIA_Gaertner_Trade_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Gaertner_Plants)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gaertner_Trade_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other,self ,"DIA_Gaertner_Trade_15_00"); //Poka� mi swoje towary.
};
//*************************************************************
//		Krautabak
//*************************************************************
INSTANCE DIA_Gaertner_Krautabak(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 5;
	condition	= DIA_Gaertner_Krautabak_Condition;
	information	= DIA_Gaertner_Krautabak_Info;
	permanent	= FALSE;
	description = "Mam tu troch� ziela.";
};                       

FUNC INT DIA_Gaertner_Krautabak_Condition()
{	
	if (Npc_HasItems (other,ItMi_SumpfTabak) >= 1)
	&& Wld_IsTime (06,45,21,45)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gaertner_Krautabak_Info()
{	
	AI_Output (other,self ,"DIA_Gaertner_Krautabak_15_00"); //Mam tu troch� ziela. Chcesz sobie zapali�?
	AI_Output (self ,other,"DIA_Gaertner_Krautabak_09_01"); //Sam nie wiem... A zreszt�, dawaj je tutaj. Skr�c� sobie jednego.
	
	B_GiveInvItems (other, self, ItMi_SumpfTabak,1);
	Npc_RemoveInvItems (self,ItMi_SumpfTabak,1);
	
	CreateInvItems (self, Itmi_Joint,1);
	B_UseItem (self, itmi_Joint);
	AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
	AI_Output (self ,other,"DIA_Gaertner_Krautabak_09_02"); //Kh... kh.... Kh....
	AI_PlayAni (self, "T_HEASHOOT_2_STAND");
	AI_Output (self ,other,"DIA_Gaertner_Krautabak_09_03"); //Mocny towar. Chyba ju� mi wystarczy.
	
	B_GivePlayerXP (XP_Ambient);
};
//*************************************************************
//		Sign
//*************************************************************
INSTANCE DIA_Gaertner_Sign(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 6;
	condition	= DIA_Gaertner_Sign_Condition;
	information	= DIA_Gaertner_Sign_Info;
	permanent	= FALSE;
	description = "(Poka� z�odziejski gest)";
};                       

FUNC INT DIA_Gaertner_Sign_Condition()
{	
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gaertner_Sign_Info()
{	
	AI_PlayAni (other, "T_YES");
	AI_Output (self ,other,"DIA_Gaertner_Sign_09_00"); //A wi�c jeste� jednym z nas. Mam dla ciebie po�yteczn� wskaz�wk�.
	AI_Output (self ,other,"DIA_Gaertner_Sign_09_01"); //W okolicznych domach bardzo cz�sto znajdziesz skrytki, otwierane przez naci�ni�cie ukrytego przycisku.
	AI_Output (self ,other,"DIA_Gaertner_Sign_09_02"); //Ludzie zwykle trzymaj� w nich kosztowno�ci.
};

