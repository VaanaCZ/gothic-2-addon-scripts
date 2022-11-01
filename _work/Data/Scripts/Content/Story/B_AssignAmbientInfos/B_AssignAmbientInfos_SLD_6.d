// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_6_EXIT_Condition;
	information	= DIA_SLD_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_6_JOIN_Condition;
	information	= DIA_SLD_6_JOIN_Info;
	permanent	= TRUE;
	description = "Voglio unirmi a voi!";
};                       

FUNC INT DIA_SLD_6_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_JOIN_15_00"); //Voglio unirmi a voi!
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_01"); //Ho saputo della faccenda sulla guardia cittadina. Torlof dice che hai superato la prova. Hai il mio voto.
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_02"); //Derubare i contadini è un conto, ma combattere contro la guardia cittadina è tutta un'altra cosa. Ma se vai bene a Onar, allora per me non ci sono problemi...
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_03"); //Parla con Torlof. Ti dirà quello che devi fare... (ride)
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_6_PEOPLE_Condition;
	information	= DIA_SLD_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Chi è il capo, qui?";
};                       

FUNC INT DIA_SLD_6_PEOPLE_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_PEOPLE_15_00"); //Chi è il capo, qui?
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_01"); //La fattoria appartiene a Onar, se è questo ciò che intendi, ma il nostro capo è Lee.
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_02"); //Egli era un generale dell'esercito reale, ma ora non è più in 'rapporti così amichevoli' con il re (ride).
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_03"); //Ricordati il suo nome. Se dovessi finire nei guai qui, egli è probabilmente l'unica persona in grado di aiutarti. Tutti gli altri vorranno semplicemente farti la pelle.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_6_LOCATION_Condition;
	information	= DIA_SLD_6_LOCATION_Info;
	permanent	= TRUE;
	description = "State sorvegliando i contadini?";
};                       

FUNC INT DIA_SLD_6_LOCATION_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_LOCATION_15_00"); //State sorvegliando i contadini?
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_01"); //Noi siamo a guardia dell'intera valle, non solo della fattoria di Onar.
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_02"); //Onar vuole che ci andiamo giù pesanti con chiunque causi dei guai qui, perciò comportati bene.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_6_STANDARD_Condition;
	information	= DIA_SLD_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Cosa succede?";
};                       
func INT DIA_SLD_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_STANDARD_15_00"); //Cosa succede?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_01"); //Ora sei uno di noi, ragazzo!
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_02"); //Che vuoi?
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_03"); //Quando ho saputo dei draghi, all'inizio stentavo a crederci.
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_04"); //Un drago, questo sì che è un combattimento. Finalmente un avversario degno, non più pecore o stupide guardie cittadine.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_05"); //Il tuo Lord Hagen se l'è già fatta sotto dalla paura dei draghi?
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_06"); //Sembra che ora dovrà muovere il suo nobile fondoschiena dalla città.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_07"); //Lord Hagen può ritenersi fortunato. Ancora un paio di giorni e avremmo tirato Bennet fuori di lì da soli.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_08"); //Se non lasciano uscire Bennet di prigione, lo tireremo fuori noi.
		};	
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_09"); //Cosa ci fai ancora qui? Non eri andato nella valle insieme agli altri?
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_10"); //Per quel che me ne importa, potete anche morire tutti.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_11"); //Dovresti andare nella Valle delle Miniere. Ho sentito dire che quei poveri bastardi avranno bisogno di tutto l'aiuto possibile.
		};	
	};
	
	if (Kapitel >= 5)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_12"); //Quando ti ho visto per la prima volta, ho capito subito che avresti rivoltato questo posto sottosopra.
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_13"); //Ma i draghi? È una faccenda piuttosto seria. Nessuno combatterà contro di te per un po' di tempo.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_14"); //Sono stupefatto. Anche se sei dalla parte sbagliata, hai fatto un'ottima cosa uccidendo i draghi.
		};	
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_6 (var c_NPC slf)
{
	DIA_SLD_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
