// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bones_EXIT(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 999;
	condition	= DIA_Addon_Bones_EXIT_Condition;
	information	= DIA_Addon_Bones_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bones_PICKPOCKET (C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 900;
	condition	= DIA_Addon_Bones_PICKPOCKET_Condition;
	information	= DIA_Addon_Bones_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bones_PICKPOCKET_Condition()
{
	C_Beklauen (75, 104);
};
 
FUNC VOID DIA_Addon_Bones_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
	
func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
func void B_Addon_Bones_KeineZeit()
{
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_01"); //Mi dispiace. Non ho tempo, adesso.
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //Devo esercitarmi.
};
// -------------------------------------------------------------
INSTANCE DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 1;
	condition	= DIA_Addon_Bones_Anheuern_Condition;
	information	= DIA_Addon_Bones_Anheuern_Info;

	description = "ll canyon aspetta.";
};                       
FUNC INT DIA_Addon_Bones_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bones_Anheuern_Info()
{	
	AI_Output	(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //ll canyon aspetta.
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Bones_Hello(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Hello_Condition;
	information	= DIA_Addon_Bones_Hello_Info;
	permanent	= FALSE;
	description = "Come va?";
};                       
FUNC INT DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Hello_15_00"); //Come va?
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //Non posso lamentarmi. È un po' noioso, ma almeno non devo lavorare.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //Mi sto preparando per l'incarico che Greg mi ha affidato.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //E sarebbe?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //È un segreto.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //Senza offesa, amico. Ho lavorato sodo per guadagnarmi questo privilegio e non voglio perderlo.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  			Kannst du mir was beibringen? 
// ************************************************************
INSTANCE DIA_Addon_Bones_Train(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Train_Condition;
	information	= DIA_Addon_Bones_Train_Info;
	permanent	= FALSE;
	description = "Puoi insegnarmi qualcosa?";
};                       
FUNC INT DIA_Addon_Bones_Train_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //Puoi insegnarmi qualcosa?
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  			Wo finde ich Lehrer
// ************************************************************
INSTANCE DIA_Addon_Bones_Teacher(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Teacher_Condition;
	information	= DIA_Addon_Bones_Teacher_Info;
	permanent	= FALSE;
	description = "Chi può insegnarmi qualcosa, qui?";
};                       
FUNC INT DIA_Addon_Bones_Teacher_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Bones_Teacher_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //Chi può insegnarmi qualcosa, qui?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //Henry e Morgan sono a capo dei razziatori.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //Possono insegnarti a combattere meglio.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //Gli uomini di Henry usano armi a due mani.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //Morgan preferisce le armi a una mano, più veloci.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //Chi altri?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //Non ne ho idea, non mi sono mai interessato d'altro.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //Ma sono sicuro che Alligatore Jack o Samuel possono insegnarti un paio di trucchetti.
	Knows_HenrysEntertrupp = TRUE;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);

};

// ************************************************************
// 			  			Was weißt du über Francis?
// ************************************************************
INSTANCE DIA_Addon_Bones_Francis(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 3;
	condition	= DIA_Addon_Bones_Francis_Condition;
	information	= DIA_Addon_Bones_Francis_Info;
	permanent	= FALSE;
	description = "Cosa sai di Francis?";
};                       
FUNC INT DIA_Addon_Bones_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Bones_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //Cosa sai di Francis?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //Guardati intorno. Qui lavorano solo Henry e i suoi uomini.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //Morgan non fa altro che dormire o ubriacarsi.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //Greg non tollera i lavativi. Con lui o fili dritto o fili via, senza storie.
};

//*********************************************************
//	BDT Armor
//*********************************************************
instance DIA_Addon_Bones_WantArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_WantArmor_Condition;
	information	= DIA_Addon_Bones_WantArmor_Info;
	permanent	= TRUE;
	description = "Dammi quell'armatura da brigante.";
};                       
FUNC INT DIA_Addon_Bones_WantArmor_Condition()
{
	if (Greg_GaveArmorToBones == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Bones_WantArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_WantArmor_15_00"); //Dammi quell'armatura da brigante.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //Fossi pazzo! Greg mi taglierebbe la testa.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //Ha detto che nessuno avrà quell'armatura a meno che non lo ordini lui.
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //Non posso dartela, soprattutto adesso che è tornato.
	};
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bones non mi darà l'armatura senza il permesso di Greg."); 
};

//*********************************************************
//	Du sollst mir die Rüstung geben.
//*********************************************************
instance DIA_Addon_Bones_GiveArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_GiveArmor_Condition;
	information	= DIA_Addon_Bones_GiveArmor_Info;
	permanent	= FALSE;
	description = "Devi darmi l'armatura da brigante. Ordini di Greg.";
};                       
FUNC INT DIA_Addon_Bones_GiveArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_GiveArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //Devi darmi l'armatura da brigante. Ordini di Greg.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //Di Greg? Meno male, temevo che dopo tutto avrei dovuto andarci.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //Fare la spia nel campo dei briganti è praticamente una missione suicida.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //Preferisco che Greg mi ammazzi di lavoro piuttosto che farmi ammazzare da quei briganti.
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //(irritato) L'armatura.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //Oh sì, giusto. Eccola.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //Ma fai attenzione. Quei briganti sono gentaglia.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"L'ordine di Greg sembra fare miracoli. Ho l'armatura da brigante!"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

