// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_6_EXIT_Condition;
	information	= DIA_MIL_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_6_JOIN_Condition;
	information	= DIA_MIL_6_JOIN_Info;
	permanent	= TRUE;
	description = "Cosa devo fare per unirmi alla guardia cittadina?";
};                       

FUNC INT DIA_MIL_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //Cosa devo fare per unirmi alla guardia cittadina?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Vai a parlare con Lord Andre. Da quando i paladini sono giunti in città, egli ha assunto il comando dell'intera guardia cittadina.
	if (C_NpcIsInQuarter (self) != Q_KASERNE)
	{
		AI_Output (self, other, "DIA_MIL_6_JOIN_06_02"); //Puoi trovarlo alla caserma. Non si muove quasi mai da lì.
	};
};

// *************************************************************************
// 						MissingPeople
// *************************************************************************
instance DIA_Addon_MIL_6_MissingPeople		(C_INFO)
{
	nr		 = 	2;
	condition	 = 	DIA_Addon_MIL_6_MissingPeople_Condition;
	information	 = 	DIA_Addon_MIL_6_MissingPeople_Info;
	permanent	= TRUE;
	description	 = 	"Ho saputo che alcuni cittadini sono scomparsi.";
};

func int DIA_Addon_MIL_6_MissingPeople_Condition ()
{
	if (Kapitel == 1)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_MIL_6_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //Ho sentito che alcuni cittadini sono scomparsi.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //In effetti ho sentito parecchie voci su persone scomparse, ultimamente.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //Proprio non me lo spiego.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Ma non possiamo fare altro che tenere gli occhi aperti e fare il nostro dovere di sentinelle.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_6_PEOPLE_Condition;
	information	= DIA_MIL_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Parlami dei paladini.";
};                       

FUNC INT DIA_MIL_6_PEOPLE_Condition()
{
	IF (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_PEOPLE_15_00"); //Parlami dei paladini.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Da quando i paladini sono giunti a Khorinis, si sono ritirati nella parte alta della città.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //Non lasciano entrare più nessuno, tranne ovviamente la popolazione e la guardia cittadina.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Ci sono anche alcuni paladini a guardia di una nave giù al porto, ma sono persone tutt'altro che loquaci.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_6_LOCATION_Condition;
	information	= DIA_MIL_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Cosa c’è da sapere su questa città?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //Cosa c’è da sapere su questa città?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //I paladini ora hanno il controllo su tutta la città e sulla guardia cittadina.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Lord Andre è il comandante della guardia cittadina e allo stesso tempo svolge le funzioni di giudice.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Se mai dovessi infrangere la legge, dovrai rendere conto a lui.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Ma è abbastanza indulgente con tutti. Di solito lascia andare le persone con una semplice ammenda.
	
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_6_STANDARD_Condition;
	information	= DIA_MIL_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};                       
func INT DIA_MIL_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_STANDARD_15_00"); //Novità?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //Altre canaglie si sono riversate in città ultimamente.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //I furti sono all'ordine del giorno e Lord Andre sospetta che siano opera di una banda.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Abbiamo rivoltato l'intero distretto del porto non molto tempo fa, ma non abbiamo ancora trovato niente.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Attualmente sembra che il problema dei briganti sia stato in buona parte risolto. Gli attacchi sono diminuiti notevolmente di recente.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //Con tutto questo afflusso di gentaglia, le cose vanno sempre peggio. La scorsa notte ho inseguito un uomo vestito di nero nella parte alta della città.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Sono sicuro che si trattava di un poco di buono, ma quando l'ho seguito intorno alla casa del governatore, è sparito nel nulla. Che strano individuo...
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //Dicono che Lord Hagen abbia assunto dei mercenari per combattere contro i draghi. Mi fa piacere, io non ho alcuna intenzione di affrontare un drago da solo.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //Dicono che i draghi siano stati sconfitti! Lord Hagen sta raccogliendo le sue forze per cacciare anche le creature rimaste dalla Valle delle Miniere.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_6 (var c_NPC slf)
{
	DIA_MIL_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
