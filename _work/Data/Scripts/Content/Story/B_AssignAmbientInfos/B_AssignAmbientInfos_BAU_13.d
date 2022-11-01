// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_13_EXIT_Condition;
	information	= DIA_BAU_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_13_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_13_JOIN_Condition;
	information	= DIA_BAU_13_JOIN_Info;
	permanent	= TRUE;
	description = "Parlami ancora di quei mercenari!";
};                       

FUNC INT DIA_BAU_13_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_JOIN_15_00"); //Parlami ancora di quei mercenari!
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_01"); //Se mai dovessi avere dei problemi con loro, vai a parlare con Lee. È quello che fanno i contadini. Egli è davvero severo con i suoi uomini.
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_02"); //Ho visto uno di loro comportarsi male, e lui lo ha punito duramente.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_13_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_13_PEOPLE_Condition;
	information	= DIA_BAU_13_PEOPLE_Info;
	permanent	= TRUE;
	description = "Chi è il capo, qui?";
};                       

FUNC INT DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_PEOPLE_15_00"); //Chi è il capo, qui?
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_01"); //Se vuoi saperlo, per me sono i mercenari che comandano. Certo, Onar li paga, ma chissà fino a quando accetteranno di prendere ordini da lui.
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_02"); //Se ai mercenari dovesse passare per la mente che possono fare a meno di lui, non vorrei essere nei suoi panni.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_13_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_13_LOCATION_Condition;
	information	= DIA_BAU_13_LOCATION_Info;
	permanent	= TRUE;
	description = "Cosa mi dici di questa zona?";
};                       

FUNC INT DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_LOCATION_15_00"); //Cosa mi dici di questa zona?
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_01"); //Ci sono tre fattorie qui. Quella di Onar a est e quella di Sekob al confine nord della valle.
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_02"); //A sud-ovest c'è una strada che conduce all'altopiano. Lì si trova la fattoria di Bengar.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_13_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_13_STANDARD_Condition;
	information	= DIA_BAU_13_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};                       
func INT DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_13_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_STANDARD_15_00"); //Novità?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_01"); //Le truppe provenienti dalla città non portano più via il nostro raccolto e il nostro bestiame! Ora che siamo in grado di difenderci da soli, preferiscono non rischiare!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_02"); //Ai paladini in città non importa niente di noi contadini. Se gli orchi dovessero attaccarci, dovremmo cavarcela da soli.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_03"); //Draghi! Circolano voci che si trovino nella Valle delle Miniere. Attraverseranno presto il passo!
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_04"); //Dicono addirittura che alcuni briganti provenienti dalle montagne si siano diretti verso la Valle delle Miniere. Beh, sarebbe troppo pericoloso per me.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_05"); //Quando le tasse scenderanno e verremo pagati in maniera ragionevole per il nostro lavoro, allora faremo di nuovo affari con la città.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_13 (var c_NPC slf)
{
	DIA_BAU_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
