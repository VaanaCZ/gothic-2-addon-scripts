// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_12_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_12_EXIT_Condition;
	information	= DIA_PAL_12_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_12_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_12_JOIN_Condition;
	information	= DIA_PAL_12_JOIN_Info;
	permanent	= TRUE;
	description = "Voglio diventare un paladino!";
};                       

FUNC INT DIA_PAL_12_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_JOIN_15_00"); //Voglio diventare un paladino!
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_01"); //Tu? Ma non farmi ridere! Non fai nemmeno parte della guardia cittadina.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_02"); //Se non sapessi con certezza che sei uno sciocco bifolco, penserei che tu abbia tentato di insultarmi.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_03"); //Solo i migliori fra i seguaci del Re e di nostro Signore Innos sono ammessi come paladini.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_12_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_12_PEOPLE_Condition;
	information	= DIA_PAL_12_PEOPLE_Info;
	permanent	= TRUE;
	description = "Chi comanda, qui?";
};                       

FUNC INT DIA_PAL_12_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_PEOPLE_15_00"); //Chi comanda, qui?
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_01"); //L'onorevole Lord Hagen. Ma è Lord Andre il responsabile di tutto ciò che riguarda la popolazione.
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_02"); //Lo troverai nella caserma. Se sarai fortunato potrebbe dedicarti un po' del suo tempo prezioso.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_12_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_12_LOCATION_Condition;
	information	= DIA_PAL_12_LOCATION_Info;
	permanent	= TRUE;
	description = "Cosa ci fate voi paladini qui a Khorinis?";
};                       

FUNC INT DIA_PAL_12_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_LOCATION_15_00"); //Cosa ci fate voi paladini qui a Khorinis?
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_01"); //Le persone che fanno queste domande si ritrovano appese alla forca prima che possano rendersene conto.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_02"); //Se c'è UNA cosa che Lord Andre non sopporta è veder cadere nelle mani di spie le informazioni sulla nostra missione.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_03"); //Dunque faresti meglio a stare attento a come parli.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_12_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_12_STANDARD_Condition;
	information	= DIA_PAL_12_STANDARD_Info;
	permanent	= TRUE;
	description = "Come vanno le cose?";
};
                       
func INT DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_STANDARD_15_00"); //Come vanno le cose?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_01"); //Ora che sappiamo di avere a che fare con i draghi, il nostro comandante farà certamente qualcosa al più presto.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_02"); //Non abbiamo ancora ricevuto notizie dal nostro contingente nella Valle delle Miniere. La cosa è molto sospetta.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_12_STANDARD_12_03"); //Sia lodato Innos! La minaccia dei draghi è stata scongiurata. Ora per mettere le mani sul metallo dobbiamo solo annientare gli orchi.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_12_STANDARD_12_04"); //Non crederai sul serio che risponda a questa domanda, vero?
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_12 (var c_NPC slf)
{
	DIA_PAL_12_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
