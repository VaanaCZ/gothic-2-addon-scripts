// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_1_EXIT_Condition;
	information	= DIA_BAU_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_1_JOIN_Condition;
	information	= DIA_BAU_1_JOIN_Info;
	permanent	= TRUE;
	description = "Parlami ancora di quei mercenari.";
};                       

FUNC INT DIA_BAU_1_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_JOIN_15_00"); //Parlami ancora di quei mercenari.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_01"); //Posso solo consigliarti di starne alla larga.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_02"); //Se a uno di loro non piace la tua faccia, potrebbe semplicemente fartelo capire con un pugno sul naso.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_03"); //Dopo puoi andarti a lamentare da Lee, ma il tuo naso rimarrà comunque rotto.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_1_PEOPLE_Condition;
	information	= DIA_BAU_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Chi è il capo, qui?";
};                       

FUNC INT DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_PEOPLE_15_00"); //Chi è il capo, qui?
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_01"); //Questa è la fattoria di Onar. È lui che prende tutte le decisioni da queste parti.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_02"); //Lascia che ti dia un consiglio: non combattere con i suoi mercenari. È gente che è meglio non stuzzicare.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_03"); //Silvio in particolare è un subdolo farabutto. Ma il loro capo, Lee, è uno a posto.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_1_LOCATION_Condition;
	information	= DIA_BAU_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Allora, che cosa c’è in questa zona?";
};                       

FUNC INT DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_LOCATION_15_00"); //Allora, che cosa c’è in questa zona?
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_01"); //Solo campi e fattorie, e un sacco di mercenari. Ma quasi tutti si trovano a est, nella fattoria di Onar.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_02"); //A nord c'è la fattoria di Sekob, ma vanno lì solo quando devono riscuotere l'affitto.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_03"); //A sud-ovest c'è la strada che porta alla fattoria di Bengar.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_1_STANDARD_Condition;
	information	= DIA_BAU_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};                       
func INT DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_STANDARD_15_00"); //Novità?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_01"); //Onar ha assoldato dei mercenari per difenderci dalle guardie cittadine, altrimenti esse ci ruberebbero le nostre pecore fino all'ultima.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_02"); //Figuriamoci. È sempre la stessa storia. Guardie cittadine, orchi e razziatori dei campi.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_03"); //Stanno succedendo delle strane cose qui. Un paio di notti fa ho visto una figura nera. Non era un essere umano.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_04"); //Ci sono sempre più avvistamenti di orchi. A volte penso che per ogni orco che uccidiamo ne spuntino fuori due nuovi.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_05"); //I paladini si stanno dirigendo nella Valle delle Miniere. Per quale scopo, dico io? Non rimarrà più nessuno per contrastare le guardie cittadine.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_1 (var c_NPC slf)
{
	DIA_BAU_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
