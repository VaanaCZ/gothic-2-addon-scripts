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
	AI_Output (self, other,"DIA_Joe_Hallo_10_00");//Oye, gracias, t�o. Digo... gracias, de verdad. Y yo que pensaba que nunca saldr�a de aqu�...
	TOPIC_END_Joe = TRUE;
	B_GivePlayerXP ((XP_Ambient*4));
	
	AI_Output (other, self,"DIA_Joe_Hallo_15_01");//�Qu� est�s haciendo AQU�?
	AI_Output (self, other,"DIA_Joe_Hallo_10_02");//Me qued� encerrado. La puerta estaba abierta y lo �nico que quer�a era echar un vistazo. Pero en cuanto entr�, el vigilante vino y cerr� la maldita puerta.
	AI_Output (self, other,"DIA_Joe_Hallo_10_03");//Esto es un poco humillante. Te agradecer�a mucho si esto pudiera quedar entre t� y yo.
	AI_Output (other, self,"DIA_Joe_Hallo_15_04");//Entiendo. No es algo de lo que sentirse precisamente orgulloso.
	AI_Output (self, other,"DIA_Joe_Hallo_10_05");//Creo que ahora necesito un trago.
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
	description	= "�Va todo bien?";
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
	AI_Output (other, self,"DIA_Joe_Perm_15_00");//�Va todo bien?
	AI_Output (self, other,"DIA_Joe_Perm_10_01");//Gracias por liberarme.
	
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
	description	= "(Hacer la se�al de los ladrones)";
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
	AI_Output (self, other,"DIA_Joe_Sign_10_00");//Eh, �qu� m�s da? Tenemos amigos mutuos. En ese caso, d�jame mostrarte mi gratitud por el rescate.
	AI_Output (self, other,"DIA_Joe_Sign_10_01");//Toma estas ganz�as. Estoy seguro de que te resultar�n �tiles.
	
	B_GiveInvItems (self, other, ItKE_Lockpick, 5);
	
	AI_StopProcessInfos (self);
};

 
 
