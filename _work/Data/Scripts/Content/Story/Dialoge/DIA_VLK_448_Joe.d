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
	AI_Output (self, other,"DIA_Joe_Hallo_10_00");//Hej, díky, chlape, vážně děkuju. Už jsem si myslel, že se odsud nikdy nedostanu.
	TOPIC_END_Joe = TRUE;
	B_GivePlayerXP ((XP_Ambient*4));
	
	AI_Output (other, self,"DIA_Joe_Hallo_15_01");//Co TADY děláš?
	AI_Output (self, other,"DIA_Joe_Hallo_10_02");//Jsem tu zamčenej. Ty dveře byly otevřený a já se tu jen chtěl trochu porozhlídnout - ale jakmile jsem vlez dovnitř, přišel strážce a ty zatracený dveře zamknul.
	AI_Output (self, other,"DIA_Joe_Hallo_10_03");//Je to fakt trapas - byl bych ti vděčnej, kdyby to zůstalo jen mezi náma.
	AI_Output (other, self,"DIA_Joe_Hallo_15_04");//Rozumím. Vážně to není nic příjemnýho.
	AI_Output (self, other,"DIA_Joe_Hallo_10_05");//Mám dojem, že potřebuju panáka.
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
	description	= "Je všechno v pořádku?";
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
	AI_Output (other, self,"DIA_Joe_Perm_15_00");//Je všechno v pořádku?
	AI_Output (self, other,"DIA_Joe_Perm_10_01");//Díky, žes mě z toho dostal.
	
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
	description	= "(Předvést zlodějský signál.)";
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
	AI_Output (self, other,"DIA_Joe_Sign_10_00");//Hej, co ty víš - možná máme společný přátele. V tom případě mi dovol vyjádřit svou vděčnost za svoji záchranu.
	AI_Output (self, other,"DIA_Joe_Sign_10_01");//Tady, vezmi si tyhle paklíče - jsem si jistej, že se ti budou hodit.
	
	B_GiveInvItems (self, other, ItKE_Lockpick, 5);
	
	AI_StopProcessInfos (self);
};

 
 
