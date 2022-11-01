//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_EXIT   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 999;
	condition   = DIA_Addon_Crimson_EXIT_Condition;
	information = DIA_Addon_Crimson_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Crimson_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Crimson_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Crimson_PICKPOCKET (C_INFO)
{
	npc			= BDT_1095_Addon_Crimson;
	nr			= 900;
	condition	= DIA_Addon_Crimson_PICKPOCKET_Condition;
	information	= DIA_Addon_Crimson_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Crimson_PICKPOCKET_Condition()
{
	C_Beklauen (66, 66);
};
 
FUNC VOID DIA_Addon_Crimson_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Crimson_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Crimson_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Crimson_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Crimson_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Crimson_PICKPOCKET_DoIt);
};

func void DIA_Addon_Crimson_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Crimson_PICKPOCKET);
};
	
func void DIA_Addon_Crimson_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Crimson_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Hi   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 2;
	condition   = DIA_Addon_Crimson_Hi_Condition;
	information = DIA_Addon_Crimson_Hi_Info;
	permanent   = FALSE;
	description = "Cosa stai facendo? Stai fondendo l'oro?";
};
FUNC INT DIA_Addon_Crimson_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Crimson_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Hi_15_00");//Che cosa stai facendo? Stai fondendo il tuo oro?
	AI_Output (self, other, "DIA_Addon_Crimson_Hi_10_01");//No, sto lavando la verdura. Certo che sto fondendo l'oro, e ne faccio delle monete.
	AI_Output (self, other, "DIA_Addon_Crimson_Hi_10_02");//Prova a immaginare: una bella sera, arriva Raven e mi piazza in mano uno stampo per monete.
	AI_Output (self, other, "DIA_Addon_Crimson_Hi_10_03");//Da una sola pepita riesco a coniare un mucchio di monete: sono così bravo che nessuno nota la differenza!
};
//---------------------------------------------------------------------
//	Info How
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_How   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 2;
	condition   = DIA_Addon_Crimson_How_Condition;
	information = DIA_Addon_Crimson_How_Info;
	permanent   = FALSE;
	description = "Quante monete mi darai per una pepita?";
};
FUNC INT DIA_Addon_Crimson_How_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_How_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_How_15_00");//Quante monete mi darai per una pepita?
	AI_Output (self, other, "DIA_Addon_Crimson_How_10_01");//Beh, io non ti conosco, ma ti farò un prezzo speciale. Per una pepita ti dar
	B_Say_Gold (self, other, 10);
};	
//---------------------------------------------------------------------
//	Info Feilsch
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Feilsch   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 2;
	condition   = DIA_Addon_Crimson_Feilsch_Condition;
	information = DIA_Addon_Crimson_Feilsch_Info;
	permanent   = FALSE;
	description = "Contrattiamo!";
};
FUNC INT DIA_Addon_Crimson_Feilsch_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_How)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_Feilsch_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Feilsch_15_00");//Contrattiamo!
	AI_Output (self, other, "DIA_Addon_Crimson_Feilsch_10_01");//Mhmmm... no. Questo è il prezzo standard che pratico a TUTTI.
	AI_Output (other, self, "DIA_Addon_Crimson_Feilsch_15_02");//Pensavo che fosse un prezzo speciale.
	AI_Output (self, other, "DIA_Addon_Crimson_Feilsch_10_03");//Lo è. Qui sono tutti speciali, per me.
};	
//---------------------------------------------------------------------
//	Info Gold tauschen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Gold   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 99;
	condition   = DIA_Addon_Crimson_Gold_Condition;
	information = DIA_Addon_Crimson_Gold_Info;
	permanent   = TRUE;
	description = "Scambia pepite d'oro…";
};
FUNC INT DIA_Addon_Crimson_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_How)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Gold_15_00");//Facciamo uno scambio
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Scambia tutte le pepite d'oro",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Scambia 1 pepita d'oro",DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Crimson_Gold_10_01");//Ma non hai pepite d'oro con te.
	};
};	
FUNC VOID DIA_Addon_Crimson_Gold_BACK()
{
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
};
FUNC VOID DIA_Addon_Crimson_Gold_ALLE()
{
	var int CurrentNuggets;
	CurrentNuggets = Npc_HasItems (other, ItMi_GoldNugget_Addon);
	
	B_GiveInvItems (other, self, ItMi_GoldNugget_Addon, CurrentNuggets);
	B_GiveInvItems (self, other, ItMI_Gold, (CurrentNuggets * 10));
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Scambia tutte le pepite d'oro",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Scambia 1 pepita d'oro",DIA_Addon_Crimson_Gold_1);
	};
};
FUNC VOID DIA_Addon_Crimson_Gold_1()
{
	B_GiveInvItems (other, self, ItMi_GoldNugget_Addon, 1);
	B_GiveInvItems (self, other, ItMI_Gold, 10);
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Scambia tutte le pepite d'oro",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Scambia 1 pepita d'oro",DIA_Addon_Crimson_Gold_1);
	};
};
FUNC VOID B_Say_CrimsonBeliar()
{
	AI_Output (self, other, "DIA_Addon_Crimson_FATAGN_LOS_10_00");//(incantatore) KHARDIMON FATAGN SHATAR FATAGN BELIAR.
};

//---------------------------------------------------------------------
//	Info Raven
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Raven   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 9;
	condition   = DIA_Addon_Crimson_Raven_Condition;
	information = DIA_Addon_Crimson_Raven_Info;
	permanent   = FALSE;
	description = "Cosa sai su Raven?";
};
FUNC INT DIA_Addon_Crimson_Raven_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_How)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_Raven_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Raven_15_00");//Cosa sai su Raven?
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_01");//Non ci crederai. Io c'ero. Ho visto che cosa ha fatto nella tomba!
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_02");//(spaventato) Ha pronunciato borbottando alcune strane parole. E continuava a ripeterle
	B_Say_CrimsonBeliar();
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_03");//(ad alta voce) E allora una luce fortissima è uscita dalla tomba e ho udito quell'URLO.
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_04");//(chiama) Oh, dei, quella voce. Era il suono della fine del mondo!
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_05");//Raven ci ha parlato, hanno chiacchierato, Raven e QUELLA voce!
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_06");//Non ricordo che cosa hanno detto, so solo che tremavo ancora molte ore dopo essere tornato nel campo.
};	
//---------------------------------------------------------------------
//	Info FATAGN
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_FATAGN   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 98;
	condition   = DIA_Addon_Crimson_FATAGN_Condition;
	information = DIA_Addon_Crimson_FATAGN_Info;
	permanent   = TRUE;
	description = "Puoi ripetere ancora una volta le parole di Raven?";
};
FUNC INT DIA_Addon_Crimson_FATAGN_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_Raven)
	&& (Crimson_SayBeliar < 4)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_FATAGN_Info()
{
	Crimson_SayBeliar = (Crimson_SayBeliar +1);
	
	AI_Output (other, self, "DIA_Addon_Crimson_FATAGN_15_00");//Puoi ripetere le parole di Raven?
	
	if (Crimson_SayBeliar <= 3)
	{
		AI_Output (self, other, "DIA_Addon_Crimson_FATAGN_10_01");//Certo. Sei pronto?
		
		Info_ClearChoices (DIA_Addon_Crimson_FATAGN);
		Info_AddChoice (DIA_Addon_Crimson_FATAGN,"Okay.",DIA_Addon_Crimson_FATAGN_LOS);	
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Crimson_FATAGN_10_02");//Penso che faremmo meglio a lasciar perdere
	};
};	
FUNC VOID DIA_Addon_Crimson_FATAGN_LOS()
{
	Snd_Play ("Mystery_09");
	B_Say_CrimsonBeliar();
	
	if (Crimson_SayBeliar == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("DEMENTOR_FX",  self, self, 0, 0, 0, FALSE );
	};
	Info_ClearChoices (DIA_Addon_Crimson_FATAGN);
};
