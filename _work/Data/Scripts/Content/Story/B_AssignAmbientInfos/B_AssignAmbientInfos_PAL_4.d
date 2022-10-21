// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_4_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_4_EXIT_Condition;
	information	= DIA_PAL_4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_4_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_4_JOIN_Condition;
	information	= DIA_PAL_4_JOIN_Info;
	permanent	= TRUE;
	description = "Come faccio a diventare un paladino?";
};                       

FUNC INT DIA_PAL_4_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_JOIN_15_00"); //Come faccio a diventare un paladino?
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_01"); //Se stai dicendo sul serio, allora dovresti metterti al servizio dei paladini.
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_02"); //Vai alla caserma e parla con Lord Andre per essere ammesso nella guardia cittadina.
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_03"); //Magari ti verrà data la possibilità di dimostrare il tuo valore.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_4_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_4_PEOPLE_Condition;
	information	= DIA_PAL_4_PEOPLE_Info;
	permanent	= TRUE;
	description = "Chi comanda, qui?";
};                       

FUNC INT DIA_PAL_4_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_PEOPLE_15_00"); //Chi comanda, qui?
	AI_Output (self, other, "DIA_PAL_4_PEOPLE_04_01"); //Lord Hagen è il comandante supremo di tutte le truppe sull'isola. Egli inoltre occuperà l'ufficio del governatore per il tempo che rimarremo qui.
	AI_Output (self, other, "DIA_PAL_4_PEOPLE_04_02"); //Ma egli è molto occupato. Se ti serve qualcosa, vai alla caserma e parla con Lord Andre.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_4_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_4_LOCATION_Condition;
	information	= DIA_PAL_4_LOCATION_Info;
	permanent	= TRUE;
	description = "Cosa ci fate voi paladini qui a Khorinis?";
};                       

FUNC INT DIA_PAL_4_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_LOCATION_15_00"); //Cosa ci fate voi paladini qui a Khorinis?
	AI_Output (self, other, "DIA_PAL_4_LOCATION_04_01"); //Non sono autorizzato a dirtelo.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_4_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_4_STANDARD_Condition;
	information	= DIA_PAL_4_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};
                       
func INT DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_4_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_STANDARD_15_00"); //Novità?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_4_STANDARD_04_01"); //Ora che sappiamo di avere a che fare con i draghi, il nostro comandante farà certamente qualcosa subito.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_4_STANDARD_04_02"); //Non abbiamo ancora ricevuto notizie dal nostro contingente nella Valle delle Miniere. La cosa è molto sospetta.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_4_STANDARD_04_03"); //Sia lodato Innos! La minaccia dei draghi è stata scongiurata. Ora per mettere le mani sul metallo dobbiamo solo annientare gli orchi.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_4_STANDARD_04_04"); //Non ho tempo da perdere per preoccuparmi delle chiacchiere che circolano in città.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_4 (var c_NPC slf)
{
	DIA_PAL_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_4_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_4_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_4_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_4_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
