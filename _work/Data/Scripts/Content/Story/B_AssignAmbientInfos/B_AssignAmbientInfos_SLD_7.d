// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_7_EXIT_Condition;
	information	= DIA_SLD_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_7_JOIN_Condition;
	information	= DIA_SLD_7_JOIN_Info;
	permanent	= TRUE;
	description = "Voglio unirmi a voi!";
};                       

FUNC INT DIA_SLD_7_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //Voglio unirmi a voi!
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_01"); //Ho saputo che muori dalla voglia di unirti alla guardia cittadina. Potremmo avere bisogno di gente come te!
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_02"); //Non credo che riscuotere l'affito da un gruppo di contadini sia particolarmente difficile, ma se Onar ti paga per questo, per me va bene.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_03"); //Tu? Una volta che Torlof ti aveva messo alla prova te la sei fatta sotto, poveretto!
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_7_PEOPLE_Condition;
	information	= DIA_SLD_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Chi è il capo, qui?";
};                       

FUNC INT DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_PEOPLE_15_00"); //Chi è il capo, qui?
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Lee è il nostro capo e Torlof è il suo braccio destro. La maggior parte degli uomini lo segue perché egli era il loro capo ai tempi della colonia.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_02"); //E poi c'è Silvio. Egli è giunto dalle montagne con i suoi uomini dopo l'arrivo di Lee.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_03"); //Lui e i suoi uomini sono solo una piccola parte dei mercenari, ma causano parecchi guai. Quei ragazzi seguono delle regole tutte loro.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_04"); //E Silvio è uno sporco figlio di buona donna, per cui stai attento quando avrai a che fare con lui.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_7_LOCATION_Condition;
	information	= DIA_SLD_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Parlami della fattoria.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //Parlami della fattoria.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Onar ci ha assoldati per difendere le sue proprietà.
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_SLD_7_LOCATION_07_02"); //Perciò togliti dalla testa di rubare qualcosa o di attaccare i contadini, altrimenti dovrai vedertela con noi, capito?
	};
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_7_STANDARD_Condition;
	information	= DIA_SLD_7_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};                       
func INT DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_STANDARD_15_00"); //Novità?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_01"); //Da quando ti sei unito a noi, non ci sono stati problemi alla fattoria, niente più guardie cittadine.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_02"); //Qui da noi non succede molto. Prova a chiedere in città. Credo che siano a corto di cibo. (ride)
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_03"); //Draghi nella Valle delle Miniere! Non vorrei essere nei panni dei paladini in questo momento.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_04"); //Credo che il re prenderà a calci nel sedere Lord Hagen quando tornerà da lui a mani vuote a causa dei draghi.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_05"); //I tuoi paladini non possono occuparsi dei draghi? Dopo tutto, combattere è un lavoro per veri uomini.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_06"); //Hai fatto un ottimo lavoro con Bennet. Silvio sta bollendo di rabbia. Lui avrebbe preferito mettere a soqquadro la città e fare a pezzi ogni cosa.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_07"); //Cerca sempre di costringere Lee sulla difensiva, e Bennet gli aveva offerto un'occasione perfetta.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_08"); //Non so perché hai aiutato Bennet, ma credimi, è stato meglio per la città.
			};
		}
		else
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_09"); //La faccenda di Bennet è davvero un brutto affare. Forse dopo tutto dovremmo prestare ascolto a Silvio e attaccare la città.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_10"); //Cos'hai intenzione di fare con Bennet? Oh beh, non voglio saperlo. Scoprirai presto quali saranno le conseguenze.
			};
		};		
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_11"); //Credevo che anche tu fossi diretto nella valle, insieme a Silvio.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_12"); //Nessuno di noi si preoccuperebbe troppo se Silvio rimanesse nella valle. PER SEMPRE!
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_13"); //È stato molto coraggioso da parte tua venire qui tutto solo.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_14"); //Ma non mi interessa, finché non cercherai di riscuotere delle tasse.
		};
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_SLD_7_STANDARD_07_15"); //Non ce la faccio più a restare in questo posto. Ci sono solo pecore, pascoli e alberi. Voglio andarmene di qui.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_7 (var c_NPC slf)
{
	DIA_SLD_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
