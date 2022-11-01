///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sarah_EXIT   (C_INFO)
{
	npc         = VLK_470_Sarah;
	nr          = 999;
	condition   = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sarah_PICKPOCKET (C_INFO)
{
	npc			= VLK_470_Sarah;
	nr			= 900;
	condition	= DIA_Sarah_PICKPOCKET_Condition;
	information	= DIA_Sarah_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Sarah_PICKPOCKET_Condition()
{
	C_Beklauen (57, 60);
};
 
FUNC VOID DIA_Sarah_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sarah_PICKPOCKET);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_BACK 		,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};
	
func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Greet
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Greet		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  1;
	condition	 = 	DIA_Sarah_Greet_Condition;
	information	 = 	DIA_Sarah_Greet_Info;
	permanent 	 =  TRUE;
	important	 =  TRUE;
};

func int DIA_Sarah_Greet_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Greet_Info ()
{
	AI_Output (self, other, "DIA_Sarah_Add_16_07"); //Ah! Eccoti ancora qui!
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_HALLO		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	condition	 = 	DIA_Sarah_HALLO_Condition;
	information	 = 	DIA_Sarah_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Come vanno gli affari?";
};

func int DIA_Sarah_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Sarah_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Sarah_HALLO_15_00"); //Come vanno gli affari?
	AI_Output (self, other, "DIA_Sarah_HALLO_16_01"); //Quando arrivarono i paladini, pensai che fosse una buona opportunità per fare affari.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_02"); //Ma hanno incaricato Harad di forgiare le loro armi, quindi né io né Hakon riusciamo a guadagnare qualcosa.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_03"); //Inoltre, i contadini non ci forniscono più cibo e tutti i prezzi si sono impennati.
	AI_Output (self, other, "DIA_Sarah_Add_16_00"); //L'unica piccola consolazione è che i paladini stanno pagando il conto del mio motel.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Sarah vende armi al mercato.");	
};
///////////////////////////////////////////////////////////////////////
//	Info Bauern
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Bauern		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  2;
	condition	 = 	DIA_Sarah_Bauern_Condition;
	information	 = 	DIA_Sarah_Bauern_Info;
	permanent	 =  FALSE;
	description	 = 	"Che problemi ci sono con i contadini?";
};

func int DIA_Sarah_Bauern_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_HALLO)
	{
			return TRUE;
	};
};
func void DIA_Sarah_Bauern_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Bauern_15_00"); //Che problemi ci sono con i contadini?
	AI_Output (self, other, "DIA_Sarah_Bauern_16_01"); //Si rifiutano di distribuire i loro beni.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_02"); //Ora che non attraccano più navi, la città dipende interamente dalle provviste fornite dai contadini, naturalmente.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_03"); //E Onar, l'agricoltore più importante, ha assunto dei mercenari per proteggere la sua fattoria dalla guardia cittadina. Altrimenti, si servirebbero da soli.
	AI_Output (self, other, "DIA_Sarah_Add_16_01"); //Ma i mercenari non si limitano a badare alla fattoria di Onar.
	AI_Output (self, other, "DIA_Sarah_Add_16_02"); //Hanno raggiunto anche le fattorie più piccole fuori città e hanno minacciato i contadini.
	AI_Output (self, other, "DIA_Sarah_Add_16_03"); //Li ho visti mentre passavano dalla fattoria di Akil. Non vorrei essere nei suoi panni, ora.
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  3;
	condition	 = 	DIA_Sarah_AkilsHof_Condition;
	information	 = 	DIA_Sarah_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Dove si trova la fattoria di Onar?";
};

func int DIA_Sarah_AkilsHof_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_Bauern)
	{
		return TRUE;
	};
};
func void DIA_Sarah_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Sarah_AkilsHof_15_00"); //Dove si trova la fattoria di Akil?
	AI_Output (self, other, "DIA_Sarah_Add_16_04"); //Se esci dal cancello di est e segui la strada a destra, arriverai a una scalinata.
	AI_Output (self, other, "DIA_Sarah_Add_16_05"); //Conduce alla fattoria di Akil.
	AI_Output (self, other, "DIA_Sarah_Add_16_06"); //Ma non ci andrei adesso, i mercenari sono sicuramente ancora lì.
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Trade		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_Trade_Condition;
	information	 = 	DIA_Sarah_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 =	TRUE;
	description	 = 	"Mostrami la mercanzia.";
};

func int DIA_Sarah_Trade_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Sarah_HALLO))
	&& (MIS_Canthars_KomproBrief != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Sarah_Trade_15_00"); //Mostrami la mercanzia.
	
	Sarah_WaffenGesehen = TRUE;
	
};
///////////////////////////////////////////////////////////////////////
//	Info ImKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_IMKNAST		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_IMKNAST_Condition;
	information	 = 	DIA_Sarah_IMKNAST_Info;
	permanent	 = 	TRUE;
	important 	 =  TRUE;
};

func int DIA_Sarah_IMKNAST_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)	
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Sarah_IMKNAST_Info ()
{
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_00"); //Tu! Con che coraggio ti fai vedere da queste parti! Non ho prove, ma sono pronta a scommettere che c'entri qualcosa in questo sporco affare.
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_01"); //È colpa tua se sono qui. Tua e di quell'altro maledetto di Canthar. Che Innos possa punirti!
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Success		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  4;
	condition	 = 	DIA_Sarah_Success_Condition;
	information	 = 	DIA_Sarah_Success_Info;
	permanent 	 =  FALSE;
	description	 = 	"Canthar stava cercando di fregarti…";
};

func int DIA_Sarah_Success_Condition ()
{	
	if (Canthar_Ausgeliefert == TRUE)
	//|| (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Success_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Success_15_00"); //Canthar voleva fregarti per prendersi la bancarella per sé. Ma l'ho denunciato alla guardia cittadina.
	AI_Output (self, other, "DIA_Sarah_Success_16_01"); //Allora ti sei fatto nemico un uomo pericoloso. Conosco quel bastardo da parecchio tempo e ha sempre voluto il mio posto per sé.
	AI_Output (self, other, "DIA_Sarah_Success_16_02"); //Prendi quest'arma come segno della mia gratitudine.
	
	B_GivePlayerXP (XP_CantharImKnast);
	B_GiveInvItems (self, other, ItMw_Piratensaebel,1);
	
};
	
	  
	  
	   





