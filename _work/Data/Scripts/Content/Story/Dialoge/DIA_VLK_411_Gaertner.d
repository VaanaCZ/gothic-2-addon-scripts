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
	description = "Co tady dęláš?";
};                       

FUNC INT DIA_Gaertner_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gaertner_Job_Info()
{	
	AI_Output (other,self ,"DIA_Gaertner_Job_15_00"); //Co tady dęláš?
	AI_Output (self ,other,"DIA_Gaertner_Job_09_01"); //Co myslíš? Já jsem zahradník, starám se o zahradu.
	AI_Output (other,self ,"DIA_Gaertner_Job_15_02"); //Dá se âíci, že jsi tady sám, že ano?
	AI_Output (self ,other,"DIA_Gaertner_Job_09_03"); //Ano, a męlo by to tak zůstat. Jsem rád, že tady mám klid.
	AI_Output (self ,other,"DIA_Gaertner_Job_09_04"); //Jednou mę chtęli poslat do trestanecké kolonie, protože jsem oddęlal jednoho chlápka.
	AI_Output (self ,other,"DIA_Gaertner_Job_09_05"); //Ale správce Larius potâeboval dalšího zahradníka, takže jsem tady mohl zůstat.
	AI_Output (self ,other,"DIA_Gaertner_Job_09_06"); //Nakonec se tahle zahrada stala mým domovem. A já jsem spokojený.
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
	description = "Pęstuješ také bylinky?";
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
	AI_Output (other,self ,"DIA_Gaertner_Plants_15_00"); //Pęstuješ také bylinky?
	AI_Output (self ,other,"DIA_Gaertner_Plants_09_01"); //Pár. Pęstuju vrbky úzkolisté a ohnivé kopâivy. Taky jsem zkoušel trávu z bažin, ale vůbec se jí tady nedaâilo.
	AI_Output (self ,other,"DIA_Gaertner_Plants_09_02"); //Mno, právę jsem sklidil. Takže jestli chceš nęco koupit...
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Zahradník místodržícího mi může prodat nęjaké rostliny.");
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
	description = "Ukaž mi své zboží.";
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
	AI_Output (other,self ,"DIA_Gaertner_Trade_15_00"); //Ukaž mi své zboží.
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
	description = "Obstaral jsem ti nęjaký rostlinný tabák.";
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
	AI_Output (other,self ,"DIA_Gaertner_Krautabak_15_00"); //Mám tady tabákové listy. Zakouâíš si?
	AI_Output (self ,other,"DIA_Gaertner_Krautabak_09_01"); //To neznám  - ale jistę, dej to sem. Zkusím to.
	
	B_GiveInvItems (other, self, ItMi_SumpfTabak,1);
	Npc_RemoveInvItems (self,ItMi_SumpfTabak,1);
	
	CreateInvItems (self, Itmi_Joint,1);
	B_UseItem (self, itmi_Joint);
	AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
	AI_Output (self ,other,"DIA_Gaertner_Krautabak_09_02"); //Kucky... kuck....
	AI_PlayAni (self, "T_HEASHOOT_2_STAND");
	AI_Output (self ,other,"DIA_Gaertner_Krautabak_09_03"); //Silnej matroš. Myslím, že už to nikdy kouâit nebudu.
	
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
	description = "(Pâedvést zlodęjský signál.)";
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
	AI_Output (self ,other,"DIA_Gaertner_Sign_09_00"); //Tak ty jsi jedním z nás. Mám pro tebe nękolik užitečných informací.
	AI_Output (self ,other,"DIA_Gaertner_Sign_09_01"); //Nękolik domů tady nahoâe má tajné skrýše, které je možné otevâít jen pomocí nęjakého ukrytého spínače.
	AI_Output (self ,other,"DIA_Gaertner_Sign_09_02"); //Lidé za nimi schovávají své cennosti.
};

