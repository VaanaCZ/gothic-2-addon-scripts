///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Engor_EXIT   (C_INFO)
{
	npc         = VLK_4108_Engor;
	nr          = 999;
	condition   = DIA_Engor_EXIT_Condition;
	information = DIA_Engor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Engor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Engor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HALLO		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_HALLO_Condition;
	information	 = 	DIA_Engor_HALLO_Info;
	important	 = 	TRUE;
};
func int DIA_Engor_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Engor_HALLO_Info ()
{
	
 	AI_Output (self, other, "DIA_Engor_HALLO_13_00"); //Ah, dunque sei tu il tizio che è riuscito ad attraversare il passo.
	AI_Output (other, self, "DIA_Engor_HALLO_15_01"); //Sì.
	AI_Output (self, other, "DIA_Engor_HALLO_13_02"); //Ottimo. Io sono Engor, amministro questa spedizione.
	AI_Output (self, other, "DIA_Engor_HALLO_13_03"); //Non pensare che io dia qualcosa in cambio di nulla!
	AI_Output (self, other, "DIA_Engor_HALLO_13_04"); //Ma se hai dell'oro in tasca, sarò sempre felice di fare affari con te.
	
	Log_CreateTopic (TOPIC_Trader_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, "Engor gestisce i rifornimenti al castello e ci fa degli affari extra.");  
};
///////////////////////////////////////////////////////////////////////
//	Info Handeln
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HANDELN		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	10;
	condition	 = 	DIA_Engor_HANDELN_Condition;
	information	 = 	DIA_Engor_HANDELN_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Mostrami la mercanzia.";
};

func int DIA_Engor_HANDELN_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Engor_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Engor_HANDELN_Info ()
{
	B_GiveTradeInv (self);

	//Joly: Mc ArrowBolt
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
	//////////////////////////////////////////////////////////////////////////////////////

	AI_Output			(other, self, "DIA_Engor_HANDELN_15_00"); //Mostrami la mercanzia.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTPARLAF
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_ABOUTPARLAF		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_ABOUTPARLAF_Condition;
	information	 = 	DIA_Engor_ABOUTPARLAF_Info;
	description	 = 	"Sei tu quello che si occupa dei razionamenti? Così mi hanno detto...";
};

func int DIA_Engor_ABOUTPARLAF_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Parlaf_ENGOR)
	{
		return TRUE;
	};
};
func void DIA_Engor_ABOUTPARLAF_Info ()
{
	AI_Output (other, self, "DIA_Engor_ABOUTPARLAF_15_00"); //Sei tu quello che si occupa dei razionamenti, almeno così ho sentito.
	AI_Output (self, other, "DIA_Engor_ABOUTPARLAF_13_01"); //Esatto. Perché? Dovrei nutrire anche te ora?
	AI_Output (self, other, "DIA_Engor_ABOUTPARLAF_13_02"); //Se vuoi qualcosa, dovrai pagare, proprio come tutti gli altri.
};
///////////////////////////////////////////////////////////////////////
//	Info Ruestung
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_Ruestung		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_Ruestung_Condition;
	information	 = 	DIA_Engor_Ruestung_Info;
	permanent 	 =  FALSE;
	description	 = 	"Hai qualcosa di interessante per me?";
};

func int DIA_Engor_Ruestung_Condition ()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Engor_Ruestung_Info ()
{
	AI_Output (other, self, "DIA_Engor_Ruestung_15_00"); //Hai qualcosa di interessante per me?
	AI_Output (self, other, "DIA_Engor_Ruestung_13_01"); //Posso procurarti un'armatura migliore, un'armatura militare pesante, se sei interessato.
	AI_Output (self, other, "DIA_Engor_Ruestung_13_02"); //Non è a buon mercato, naturalmente. Quindi vai a procurarti l'oro, e io ti darò l'armatura.
};
///////////////////////////////////////////////////////////////////////
//	Info RSkaufen
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_RSkaufen		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_RSkaufen_Condition;
	information	 = 	DIA_Engor_RSkaufen_Info;
	permanent 	 =  TRUE;
	description	 = 	"Compra armat. pesante milizia (prot: armi 60, frecce 60. Costo: 2500 m. oro)"; 
};
//--------------------------------------
var int DIA_Engor_RSkaufen_perm;
//--------------------------------------
func int DIA_Engor_RSkaufen_Condition ()
{
	if (other.guild == GIL_MIL)
	&& Npc_KnowsInfo (other, DIA_Engor_Ruestung)
	&& (DIA_Engor_RSkaufen_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Engor_RSkaufen_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold,2500))
	{
		AI_Output (other, self, "DIA_Engor_RSkaufen_15_00"); //Dammi l'armatura.
		AI_Output (self, other, "DIA_Engor_RSkaufen_13_01"); //Ecco a te, ti offrirà una buona protezione, è un'armatura dannatamente efficace.
		B_GiveInvItems (self,other, ITAR_MIL_M,1);
		DIA_Engor_RSkaufen_perm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Engor_RSkaufen_13_02"); //Vai a prendere l'oro prima.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HELP
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HELP		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	3;
	condition	 = 	DIA_Engor_HELP_Condition;
	information	 = 	DIA_Engor_HELP_Info;
	description	 = 	"Forse posso aiutarti con il tuo lavoro.";
};

func int DIA_Engor_HELP_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Engor_ABOUTPARLAF)
	{
		return TRUE;
	};
};
func void DIA_Engor_HELP_Info ()
{
	AI_Output (other, self, "DIA_Engor_HELP_15_00"); //Forse posso aiutarti con il tuo lavoro.
	AI_Output (self, other, "DIA_Engor_HELP_13_01"); //Mmmh... Certo, perché no? Potrebbe servirmi una mano.
	AI_Output (other, self, "DIA_Engor_HELP_15_02"); //Dunque, cosa c'è da fare?
	AI_Output (self, other, "DIA_Engor_HELP_13_03"); //Le nostre scorte di cibo si stanno esaurendo. In particolare, abbiamo bisogno di carne.
	AI_Output (self, other, "DIA_Engor_HELP_13_04"); //Quindi, se tu potessi procurarci della carne, cruda o cotta, prosciutto o salsicce, lo apprezzeremmo molto. Che ne pensi, ci aiuterai?

	
	Info_ClearChoices (DIA_Engor_HELP);
	Info_AddChoice (DIA_Engor_HELP,"Non ho tempo, per questo.",DIA_Engor_HELP_NO);
	Info_AddChoice (DIA_Engor_HELP,"Non preoccuparti, ti porterò un po’ di carne.",DIA_Engor_HELP_YES);
	
	
};
FUNC VOID DIA_Engor_HELP_NO()
{
	AI_Output (other, self, "DIA_Engor_HELP_NO_15_00"); //Non ho tempo per questo.
	AI_Output (self, other, "DIA_Engor_HELP_NO_13_01"); //Allora per quale motivo stai sprecando il mio?
	
	MIS_Engor_BringMeat = LOG_OBSOLETE; 
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Engor_HELP_YES()
{
	AI_Output (other, self, "DIA_Engor_HELP_YES_15_00"); //Non preoccuparti, ti porterò un po’ di carne.
	AI_Output (self, other, "DIA_Engor_HELP_YES_13_01"); //Due dozzine circa di pezzi di carne mi aiuteranno a sfamare parecchie bocce affamate. Torna quando avrai la carne, ho bisogno di tornare al lavoro ora.

	Log_CreateTopic (TOPIC_BringMeat, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BringMeat, LOG_RUNNING);
	B_LogEntry  (TOPIC_BringMeat,"Engor ha bisogno di un paio di dozzine di pezzi di carne per approvvigionare gli uomini.");
	B_LogEntry  (TOPIC_BringMeat,"Non importa che siano salsicce, prosciutto, carne cruda o cotta. L'importante è che i ragazzi mettano qualcosa di decente sotto i denti.");  

	
	MIS_Engor_BringMeat = LOG_RUNNING;  
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info BRINGMEAT
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_BRINGMEAT		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	4;
	condition	 = 	DIA_Engor_BRINGMEAT_Condition;
	information	 = 	DIA_Engor_BRINGMEAT_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ecco, ti ho comprato qualcosa (consegna carne).";
};

func int DIA_Engor_BRINGMEAT_Condition ()
{	
	if (MIS_Engor_BringMeat == LOG_RUNNING)
	&& (Meat_Counter < Meat_Amount)
	&&((Npc_HasItems (hero, ItFo_Bacon) 	>= 1)
	|| (Npc_HasItems (hero, ItFoMuttonRaw)  >= 1)
	|| (Npc_HasItems (hero, ItFoMutton) 	>= 1)
	|| (Npc_HasItems (hero, ItFo_Sausage) 	>= 1))
	{
		return TRUE;
	};
};
func void DIA_Engor_BRINGMEAT_Info ()
{
	var string ConcatRaw;
	var string ConcatMutton;
	var string ConcatBacon;
	var string ConcatSausage;
	
	AI_Output (other, self, "DIA_Engor_BRINGMEAT_15_00"); //Ecco, ti ho portato qualcosa.
	
// ***** Rohes Fleisch *****
	if (Npc_HasItems (hero,ItFoMuttonRaw) >= 1) 
	{
		if (Npc_HasItems (hero, ItFoMuttonRaw) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			B_GiveInvItems (hero, self, ItFoMuttonRaw, (Meat_Amount - Meat_Counter));
		
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFoMuttonRaw) < Meat_Amount) // muss hier stehen, wegen nächster Zeile
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFoMuttonRaw));
			
			//B_GiveInvItems (hero, self,ItFoMuttonRaw, (Npc_HasItems (hero,ItFoMuttonRaw))); 
		
			ConcatRaw = IntToString (Npc_HasItems (other,ItFoMuttonRaw));
			ConcatRaw = ConcatStrings (ConcatRaw, " Rohes Fleisch gegeben");
			 
			AI_PrintScreen (ConcatRaw, -1, 35, FONT_ScreenSmall, 2);
			Npc_RemoveInvItems (other, ItFoMuttonRaw,(Npc_HasItems (other,ItFoMuttonRaw)));
		};
	};
// ***** gebratenes Fleisch *****
	if (Npc_HasItems (hero,ItFoMutton) >= 1) 
	{
		if (Npc_HasItems (hero, ItFoMutton) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			B_GiveInvItems (hero, self, ItFoMutton, (Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFoMutton) < Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFoMutton));
			
			//B_GiveInvItems (hero, self,ItFoMutton, (Npc_HasItems (hero,ItFoMutton)));
			
			ConcatMutton = IntToString (Npc_HasItems (other,ItFoMutton));
			ConcatMutton = ConcatStrings (ConcatMutton, " Gebratenes Fleisch gegeben");
			 
			AI_PrintScreen (ConcatMutton, -1, 38, FONT_ScreenSmall, 2);
			Npc_RemoveInvItems (other, ItFoMutton,(Npc_HasItems (other,ItFoMutton)));
		};
	};
// ***** Schinken *****	
	if (Npc_HasItems (hero,ItFo_Bacon) >= 1) 
	{
		if (Npc_HasItems (hero, ItFo_Bacon) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			B_GiveInvItems (hero, self, ItFo_Bacon, (Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFo_Bacon) < Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFo_Bacon));
			
			//B_GiveInvItems (hero, self,ItFo_Bacon, (Npc_HasItems (hero,ItFo_Bacon)));
			
			ConcatBacon =  IntToString (Npc_HasItems (other,ItFo_Bacon));
			ConcatBacon = ConcatStrings (ConcatBacon, " Schinken gegeben");
			
			AI_PrintScreen (ConcatBacon, -1, 41, FONT_ScreenSmall, 3);
			
			Npc_RemoveInvItems (other, ItFo_Bacon,(Npc_HasItems (other,ItFo_Bacon)));
		};
	};
	// ***** Würste *****	
	if (Npc_HasItems (hero,ItFo_Sausage) >= 1) 
	{
		if (Npc_HasItems (hero, ItFo_Sausage) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			
			B_GiveInvItems (hero, self, ItFo_Sausage, (Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFo_Sausage) < Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFo_Sausage));
		
			//B_GiveInvItems (hero, self,ItFo_Sausage, (Npc_HasItems (hero,ItFo_Sausage)));
			
			ConcatSausage =  IntToString (Npc_HasItems (other,ItFo_Sausage));
			ConcatSausage = ConcatStrings (ConcatSausage, " mal Wurst gegeben");
			
			AI_PrintScreen (ConcatSausage, -1, 44, FONT_ScreenSmall, 3);
			Npc_RemoveInvItems (other, ItFo_Sausage,(Npc_HasItems (other,ItFo_Sausage)));	
		};
	};
	// ***** Dialoge und XP *****	
	if (Meat_Amount > Meat_Counter)
	{	
		var string GesamtFleisch;
		
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_01"); //Non c'è male come inizio, ma me ne serve di più.
		
		GesamtFleisch = IntToString (Meat_Counter);
		GesamtFleisch = ConcatStrings ("Insgesamt Fleisch gegeben: ",GesamtFleisch);
		
		AI_PrintScreen (GesamtFleisch, -1, 48, FONT_ScreenSmall, 3);
	};
	if (Meat_counter >= Meat_Amount)
	{
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_02"); //Ottimo, hai portato abbastanza carne. Basterà per un po'.
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_03"); //Ma non credere che ora ti darò qualcosa in cambio di nulla!
		/*
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_04"); //Hm...
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_05"); //Na schön. Du hast mir geholfen, du kriegst was umsonst. Ich gebe dir eine Information. 	
		*/
		MIS_Engor_BringMeat = LOG_SUCCESS;
		B_GivePlayerXP (XP_BringMeat);
		Log_AddEntry (TOPIC_BringMeat,"Engor ha la carne. Si assicurerà che sia distribuita tra gli uomini."); 
	};
};

//*************************************
//*************************************
//***								***
//***			Kapitel 4			***
//***								***
//*************************************
//*************************************

///////////////////////////////////////////////////////////////////////
//	Wie laufen die Geschäfte?
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_Business		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	1;
	condition	 = 	DIA_Engor_Business_Condition;
	information	 = 	DIA_Engor_Business_Info;
	permanent	 =	FALSE;	
	description	 = 	"Come vanno gli affari?";
	
};

func int DIA_Engor_Business_Condition ()
{
	if (Kapitel >= 4)
	&& (MIS_Engor_BringMeat == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Engor_Business_Info ()
{
	AI_Output (other, self, "DIA_Engor_Business_15_00"); //Come vanno gli affari?
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			AI_Output (self, other, "DIA_Engor_Business_13_01"); //Così così. Spero che i cacciatori di draghi siano pieni d'oro come lo sono di aria calda.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Engor_Business_13_02"); //Malissimo! I paladini non comprano niente.
		};

	AI_Output (self, other, "DIA_Engor_Business_13_03"); //Cosa mi dici di te, c'è qualcosa di cui hai bisogno?
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Engor_PICKPOCKET (C_INFO)
{
	npc			= VLK_4108_Engor;
	nr			= 900;
	condition	= DIA_Engor_PICKPOCKET_Condition;
	information	= DIA_Engor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sarebbe rischioso sottrargli la mappa)";
};                       

FUNC INT DIA_Engor_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_Map_Oldworld) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Engor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Engor_PICKPOCKET);
	Info_AddChoice		(DIA_Engor_PICKPOCKET, DIALOG_BACK 		,DIA_Engor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Engor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Engor_PICKPOCKET_DoIt);
};

func void DIA_Engor_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self, other, ItWr_Map_Oldworld, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Engor_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Engor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Engor_PICKPOCKET);
};
