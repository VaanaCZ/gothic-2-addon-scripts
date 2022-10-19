// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_1_EXIT_Condition;
	information	= DIA_VLK_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_1_JOIN_Condition;
	information	= DIA_VLK_1_JOIN_Info;
	permanent	= TRUE;
	description = "Come faccio a diventare un cittadino di questa città?";
};                       

FUNC INT DIA_VLK_1_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_JOIN_15_00"); //Come faccio a diventare un cittadino di questa città?
	AI_Output (self, other, "DIA_VLK_1_JOIN_01_01"); //Vatti a cercare un lavoro! Tutti quelli che hanno un posto fisso a Khorinis vengono considerati cittadini a tutti gli effetti.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_1_PEOPLE_Condition;
	information	= DIA_VLK_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Quali sono le personalità importanti, qui?";
};                       

FUNC INT DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_PEOPLE_15_00"); //Quali sono le personalità importanti, qui?
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_01"); //(ride) Fino a poco fa, erano il governatore e il giudice, poi sono venuti i paladini e hanno assunto il controllo della città.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_02"); //Il loro capo è Lord Hagen. Egli è il nuovo governatore, più o meno.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_03"); //Lord Andre è il suo braccio destro. Egli comanda la guardia cittadina e svolge anche la funzione di giudice.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_04"); //Tutti i cittadini che vengono accusati di un crimine devono rispondere a lui.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_1_LOCATION_Condition;
	information	= DIA_VLK_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Cosa c’è di interessante in questa città?";
};                       

FUNC INT DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_LOCATION_15_00"); //Cosa c’è di interessante in questa città?
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_01"); //Qui puoi acquistare tutto ciò che ti serve, sia dai commercianti al mercato che nella parte bassa della città.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_02"); //Ma quasi tutto ciò che puoi acquistare ha un prezzo.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_03"); //Se non hai abbastanza soldi, forse allora l'usuraio Lehmar può aiutarti. La sua casa si trova all'inizio del distretto del porto, venendo dalla parte bassa della città.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_1_STANDARD_Condition;
	information	= DIA_VLK_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};                       
func INT DIA_VLK_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_STANDARD_15_00"); //Novità?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_01"); //Dopo il crollo della Barriera, i liberi scambi con il proprietario terriero principale si sono interrotti bruscamente. Chissà cos'ha in mente. C'è qualcosa di sospetto sotto.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_02"); //Onar sta esagerando. Egli continua a non rifornire di cibo la città. Se la guardia cittadina non interviene subito, altri contadini potrebbero seguire il suo esempio e fare come gli pare.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_03"); //Ho saputo che i briganti si sono uniti ai maghi. Si tratta di grandi esperti di magia nera vestiti di nero. Sono pronto a giurare di averne visto uno in città la scorsa notte.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_04"); //Ho sentito dire che alcuni mercenari di Onar sono partiti per uccidere i draghi. Finalmente fanno qualcosa di utile!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_05"); //Dicono che i draghi siano stati sconfitti! Lord Hagen sta radunando i suoi uomini per scacciare le creature rimaste dalla Valle delle Miniere.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_1 (var c_NPC slf)
{
	DIA_VLK_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
