///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Regis_EXIT   (C_INFO)
{
	npc         = VLK_425_Regis;
	nr          = 999;
	condition   = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Regis_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Regis_PICKPOCKET (C_INFO)
{
	npc			= VLK_425_Regis;
	nr			= 900;
	condition	= DIA_Regis_PICKPOCKET_Condition;
	information	= DIA_Regis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Regis_PICKPOCKET_Condition()
{
	C_Beklauen (40, 35);
};
 
FUNC VOID DIA_Regis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Regis_PICKPOCKET);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_BACK 		,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
	
func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Hallo		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	1;
	condition	 = 	DIA_Regis_Hallo_Condition;
	information	 = 	DIA_Regis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Regis_Hallo_Condition ()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Regis_Hallo_Info ()
{	
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //Ehi, sei nuovo in città?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //Sì e tu?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //Vengo dalla terraferma e sto facendo un giro da queste parti. Ho quasi finito l'oro, perciò non mi resta che arruolarmi nell'esercito.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //Ma non voglio farlo. Non voglio essere massacrato dai quegli orchi in nome del Re.
};
///////////////////////////////////////////////////////////////////////
//	Info MILIZ
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_MILIZ		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_MILIZ_Condition;
	information	 = 	DIA_Regis_MILIZ_Info;
	permanent    =  FALSE;
	description	 = 	"Cosa mi dici della guardia cittadina?";
};
func int DIA_Regis_MILIZ_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_Hallo) 
	{
		return TRUE;
	};
};
func void DIA_Regis_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //Cosa mi dici della guardia cittadina?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //Uno dei paladini ha preso il comando, un certo Lord Andre.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //Sta cercando di mobilitare la città in caso di attacco orchesco.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //Devi prima diventare un cittadino per essere ammesso.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //Per quel che ne so, se non sei un cittadino, puoi allenarti ugualmente, ma non sarai ammesso ufficialmente.
};
///////////////////////////////////////////////////////////////////////
//	Info ANDRE
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_ANDRE		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ANDRE_Condition;
	information	 = 	DIA_Regis_ANDRE_Info;
	permanent    =  FALSE;
	description	 = 	"Cos'altro puoi dirmi di Lord Andre?";
};
func int DIA_Regis_ANDRE_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_MILIZ) 
	{
		return TRUE;
	};
};
func void DIA_Regis_ANDRE_Info ()
{
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //Cos'altro puoi dirmi di Lord Andre?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //Ha anche preso il posto del giudice.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //Se causerai guai in città, dovrai risponderne a lui.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //Una volta mi sono azzuffato con un cittadino.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //È andato a piangere da Lord Andre e a fare la spia.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //Questa piccola questione mi è costata 50 pezzi.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //Per fortuna è accaduto di notte, altrimenti ci sarebbero stati testimoni.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //Più la gente si lamenta del tuo comportamento, maggiore è la penale da pagare.
};

// ****************************************************
// 					Prügelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_Valentino_Condition;
	information	 = 	DIA_Regis_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"Con chi ha combattuto?";
};
func int DIA_Regis_Valentino_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_ANDRE) 
	{
		return TRUE;
	};
};
func void DIA_Regis_Valentino_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //Con chi ha combattuto?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //Con un tizio di nome Valentino. Frequenta spesso la taverna vicino al tempio.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //In genere non sono una persona violenta, ma QUEL tizio si meritava una ripassata...
};

// ****************************************************
// 					Valentino DEFEATED
// ****************************************************
instance DIA_Regis_ValDefeat (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ValDefeat_Condition;
	information	 = 	DIA_Regis_ValDefeat_Info;
	permanent    =  FALSE;
	description	 = 	"Ho incontrato Valentino...";
};
func int DIA_Regis_ValDefeat_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Regis_Valentino))
	&& (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_ValDefeat_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //Ho incontrato Valentino...
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //E allora?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //Gli ho dato delle sonore legnate...
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //(ride) Se le è meritate...
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //Ecco, ho trovato questo anello su di lui dopo che abbiamo appianato il nostro disaccordo.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //(sogghignando) Sei libero di passarlo alla prossima persona che lo gonfierà di botte...
	};
};

// **************************************************************
// 							PERM
// **************************************************************
//--------------------------
	var int Regis_Bogendieb;
//--------------------------
instance DIA_Regis_PERM		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr 			 =  200;
	condition	 = 	DIA_Regis_PERM_Condition;
	information	 = 	DIA_Regis_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"È accaduto qualcosa di particolare?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //È accaduto qualcosa di particolare?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //Puoi dirlo forte.
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //Hanno derubato Bosper il costruttore d'archi. Una cosa sfacciata, te lo dico!
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //Il tipo si è infiltrato in pieno giorno nel negozio e si è preso un arco.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //E Bosper lo inseguiva dicendo, 'Fermati, furfante!', ma il tipo correva troppo veloce.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //E poi una persona onesta che l'ha trovato ha restituito l'arco rubato a Bosper.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //Strano, pensi sempre che tutti si facciano gli affari propri e invece arriva questo tipo a restituire l'arco.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //Oh bene, tutto tranquillo. Immagino che quando arriveranno gli orchi, non faremo fatica ad accorgercene.
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //Hanno scoperto che il mercenario è innocente e l'hanno lasciato andare.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //Lord Hagen deve essere fuori di sé dalla rabbia.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //L'intera città ne sta parlando. Ti ricordi il paladino Lothar?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //Forse.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //In ogni caso, è morto. Assassinato in mezzo alla strada. Stanno accusando i mercenari, ovviamente.
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Crew		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	51;
	condition	 = 	DIA_Regis_Crew_Condition;
	information	 = 	DIA_Regis_Crew_Info;
	permanent    =  FALSE;
	description	 = 	"Sto cercando di radunare un equipaggio per un viaggio in mare.";
};
func int DIA_Regis_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_Crew_Info ()
{
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //Sto cercando di mettere insieme un equipaggio per un viaggio in mare.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //Non posso aiutarti. Probabilmente dovresti dare un'occhiata al porto o forse alla taverna.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //Se ci sono rimasti dei marinai, probabilmente li troverai là.

};


