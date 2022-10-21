///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Morgahard_EXIT   (C_INFO)
{
	npc         = BDT_1030_Morgahard;
	nr          = 999;
	condition   = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_HALLO		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_HALLO_Condition;
	information	 = 	DIA_Morgahard_HALLO_Info;

	description	 = 	"Eres Morgahard.";
};

func int DIA_Morgahard_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_00"); //Eres Morgahard.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_01"); //�C�mo es que conoces mi nombre?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_02"); //El juez te busca. Huiste de la c�rcel.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_03"); //�Qu� hiciste? �Robarle la cartera?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_04"); //La suya no, la del gobernador. Y fue �l quien lo orden�.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_05"); //Despu�s de que asalt�ramos al gobernador, no quiso compartir el bot�n con nosotros e hizo que nos detuvieran.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_06"); //No quer�amos acabar en la horca, y por eso huimos.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_07"); //Cre�mos que no nos coger�an. Parece que nos equivocamos.

	Info_ClearChoices	(DIA_Morgahard_HALLO);
	Info_AddChoice	(DIA_Morgahard_HALLO, "Deja de lloriquear y desenfunda el arma.", DIA_Morgahard_HALLO_attack );
	Info_AddChoice	(DIA_Morgahard_HALLO, "�Qu� podemos hacer contra el juez?", DIA_Morgahard_HALLO_richter );
	Info_AddChoice	(DIA_Morgahard_HALLO, "El juez me ha ordenado que te mate.", DIA_Morgahard_HALLO_tot );
	B_LogEntry (TOPIC_RichterLakai,"He encontrado a Morgahard, el l�der de los fugitivos."); 
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP (XP_FoundMorgahard);
};
func void DIA_Morgahard_HALLO_tot ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_tot_15_00"); //El juez me ha ordenado que te mate.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_tot_07_01"); //S�, claro. Has venido para eso, �no?

};

func void DIA_Morgahard_HALLO_richter ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_00"); //�Qu� podemos hacer contra el juez?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_01"); //Nada de nada. Permanece intocable en la parte alta de la ciudad como una ara�a en su tela.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_02"); //Yo no dir�a tanto. Solo necesitar�amos pruebas de su culpabilidad en el asunto del gobernador.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_03"); //�Pruebas, dices? Las tengo, pero �qui�n har�a caso a un delincuente condenado?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_04"); //Dame las pruebas y me asegurar� de que no se te vuelva a perseguir.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_05"); //�Seguro? Vale. Ten, toma esta carta. Lleva la firma del juez.
	B_GiveInvItems 		(self, other, ItWr_RichterKomproBrief_MIS, 1);					
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_06"); //Aunque no me exculpa, basta para confirmar que fue c�mplice en aquel asunto.
	B_LogEntry (TOPIC_RichterLakai,"Morgahard me ha dado el encargo del juez. Este trozo de papel prueba definitivamente que el juez hizo que asaltaran al gobernador Larius. Creo que es justo lo que Lee quer�a que encontrara."); 
	AI_StopProcessInfos (self);
};
var int MorgahardSucked;
func void DIA_Morgahard_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_attack_15_00"); //Deja de lloriquear y desenfunda el arma. Acabaremos con esto de una vez.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_attack_07_01"); //Me parece bien. Al fin y al cabo, no tengo nada que perder.
	AI_StopProcessInfos (self);
	MorgahardSucked = TRUE;
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_Perm_Condition;
	information	 = 	DIA_Morgahard_Perm_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Morgahard_Perm_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Morgahard_HALLO))
	&& (MorgahardSucked == FALSE)

		{
			return TRUE;
		};	
};

func void DIA_Morgahard_Perm_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm_07_00"); //Ese juez es un cerdo. Alg�n d�a le ver� ahorcado.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm2		(C_INFO)
{
	npc			 = 	BDT_1030_Morgahard;
	nr			 = 	3;
	condition	 = 	DIA_Morgahard_Perm2_Condition;
	information	 = 	DIA_Morgahard_Perm2_Info;
	important	 = 	TRUE;
	Permanent	 = 	TRUE;

};
func int DIA_Morgahard_Perm2_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (MorgahardSucked == TRUE)
		{
			return TRUE;
		};	
};
func void DIA_Morgahard_Perm2_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm2_07_00"); //�Por qu� no desapareces?
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Morgahard_PICKPOCKET (C_INFO)
{
	npc			= BDT_1030_Morgahard;
	nr			= 900;
	condition	= DIA_Morgahard_PICKPOCKET_Condition;
	information	= DIA_Morgahard_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Morgahard_PICKPOCKET_Condition()
{
	C_Beklauen (73, 45);
};
 
FUNC VOID DIA_Morgahard_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_BACK 		,DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};
	
func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};


