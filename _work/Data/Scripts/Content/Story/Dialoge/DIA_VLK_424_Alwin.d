// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Alwin_EXIT(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 999;
	condition	= DIA_Alwin_EXIT_Condition;
	information	= DIA_Alwin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alwin_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Alwin_PICKPOCKET (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 900;
	condition	= DIA_Alwin_PICKPOCKET_Condition;
	information	= DIA_Alwin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Alwin_PICKPOCKET_Condition()
{
	C_Beklauen (20, 10);
};
 
FUNC VOID DIA_Alwin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alwin_PICKPOCKET);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_BACK 		,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
	
func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
//***************************************************
//		Schafe
//***************************************************
INSTANCE DIA_Alwin_Sheep(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 3;
	condition	= DIA_Alwin_Sheep_Condition;
	information	= DIA_Alwin_Sheep_Info;
	permanent	= FALSE;
	description = "Quelle sono le tue pecore?";
};                       
FUNC INT DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Alwin_Sheep_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Sheep_15_00"); //Quelle sono le tue pecore?
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_01"); //L'unica che mi appartiene si chiama Lucy (ride). Lucy è mia moglie.
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_02"); //Il gregge appartiene all'esercito. Mi portano tutte le pecore che prendono dagli altri contadini.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_Fellan(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_Fellan_Condition;
	information	= DIA_Alwin_Fellan_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Alwin_Fellan_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Fellan_Info()
{	
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_00"); //Ragazzo, quel martellare continuo mi sta facendo impazzire.
	AI_Output (other, self,"DIA_Alwin_Fellan_15_01"); //Di chi stai parlando?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_02"); //Non senti un martellamento? Chi pensi che possa martellare tutto il giorno nel distretto del porto?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_03"); //Quel lunatico di Fellan, martella tutto il giorno la sua capanna.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_FellanRunning (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_FellanRunning_Condition;
	information	= DIA_Alwin_FellanRunning_Info;
	permanent	= FALSE;
	description = "Potrei occuparmi di Fellan...";
};                       
FUNC INT DIA_Alwin_FellanRunning_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanRunning_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_00"); //Potrei occuparmi di Fellan...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_01"); //Mi vuoi aiutare? Che cosa vuoi in cambio?
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_02"); //Dimmelo.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_03"); //Oh, funziona così! Va bene, se riuscirai a farlo smettere di martellare, ti pagherò 25 pezzi d'oro.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_04"); //Ma ti dico una cosa subito, non puoi parlarci. Gli unici argomenti che capisce sono un paio di pugni.
	
	MIS_AttackFellan = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Alwin,LOG_RUNNING);
	B_LogEntry (TOPIC_Alwin,"Alwin vuole che faccia smettere Fellan di martellare. Ucciderlo non è la soluzione migliore.");
		
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
	Info_AddChoice (DIA_Alwin_FellanRunning, "Vedrò cosa posso fare...", DIA_Alwin_FellanRunning_Ok);
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		Info_AddChoice (DIA_Alwin_FellanRunning, "Se gli metto le mani addosso, dovrò vedermela con la guardia cittadina...", DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Ok_15_00"); //Vedrò cosa posso fare...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_Ok_12_01"); //Pensaci. Ricorda, ti pagherò 25 monete.
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Problems_15_00"); //Se gli metto le mani addosso, dovrò vedermela con la guardia cittadina...
	AI_Output (self ,other,"DIA_Alwin_Add_12_00"); //Qui al porto, nessuno fa molta attenzione alle risse...
	AI_Output (self ,other,"DIA_Alwin_Add_12_01"); //Ma se rubi o fai qualcosa al gregge, sarai nei guai.

	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_01"); //Der irre Fellan wird nicht zur Miliz rennen und dich anzeigen. Du könntest höchstens ein Problem bekommen, wenn seine Nachbarn was davon mitbekommen.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_02"); //Schlägereien sind hier nicht gerne gesehen, und je mehr Zeugen es gibt, desto schlimmer wird die Sache.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_03"); //Aber wenn du ihn dazu bringst, dass ER dich angreift, werden alle Leute, die den Kampf mitkriegen, auf deiner Seite sein.
};

//***************************************************
//		Fellan auf's Maul gehauen 
//***************************************************
INSTANCE DIA_Alwin_FellanSuccess(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 4;
	condition	= DIA_Alwin_FellanSuccess_Condition;
	information	= DIA_Alwin_FellanSuccess_Info;
	permanent	= FALSE;
	description	= "Fellan non martellerà più.";
};                       
FUNC INT DIA_Alwin_FellanSuccess_Condition()
{	
	if (MIS_AttackFellan == LOG_RUNNING)
	&& ((FellanGeschlagen == TRUE)
	|| Npc_IsDead (Fellan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanSuccess_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanSuccess_15_00"); //Fellan non martellerà più.
	AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_01"); //Hai sentito? Non c'è più martellamento. Era ora. Pensavo che il tipo non avrebbe mai smesso.
	
	if (Npc_IsDead (Fellan) == FALSE) 
	{
		AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_02"); //Mi hai fatto un grandissimo favore, penso che ti darò 30 pezzi d'oro.
		
		B_GiveInvItems (self, other, ItMi_Gold, 30);
		
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient); 
	}
	else 
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};
//***************************************************
//		Perm Info
//***************************************************
INSTANCE DIA_Alwin_Endlos(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 8;
	condition	= DIA_Alwin_Endlos_Condition;
	information	= DIA_Alwin_Endlos_Info;
	permanent	= TRUE;
	description	= "E come stanno le pecore?";
};                       
FUNC INT DIA_Alwin_Endlos_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Alwin_Sheep)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Endlos_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Endlos_15_00"); //E come stanno le pecore?
	
	if (MIS_AttackFellan != LOG_SUCCESS)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_01"); //Il martellamento di Fellan sta facendo impazzire il gregge. Un giorno o l'altro succederà...
		
	}
	else if (Kapitel <= 2)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_02"); //Le pecore mangiano e diventano sempre più grasse. Proprio come mia moglie. AHAHAHAHA! (ride sonoramente)
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_03"); //Probabilmente dovrò ucciderne una per l'ultima cena!
			AI_Output (other, self,"DIA_Alwin_Endlos_15_04"); //Per cosa?
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_05"); //Per il mercenario che ha ucciso il paladino. Naturalmente verrà giustiziato.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_06"); //Devo solo decidere quale creatura andrà al macello.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_07"); //Lucy è molto fortunata ad essere viva.
			AI_Output (other, self,"DIA_Alwin_Endlos_15_08"); //Pensavo che Lucy fosse tua moglie.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_09"); //Certo, ma ho anche una pecora di nome Lucy che avrebbe dovuto essere l'ultima cena di Bennet.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_10"); //Ma tutto si è risolto. Lucy sarà contenta.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_11"); //Con il tempo, guardare le pecore mangiare può diventare abbastanza noioso.
	}
	else	//Kapitel 5
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_12"); //Le sto salutando. Lord Hagen ha ordinato che tutte le pecore siano destinate all'approvvigionamento del suo esercito.
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_13"); //Bene, così avrò un po' più di tempo per mia moglie.
	};
};



