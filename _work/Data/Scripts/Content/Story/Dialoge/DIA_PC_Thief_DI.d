// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_PC_Thief_DI_EXIT(C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 999;
	condition	= DIA_PC_Thief_DI_EXIT_Condition;
	information	= DIA_PC_Thief_DI_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PC_Thief_DI_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_PC_Thief_DI_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  	  Hallo
// ************************************************************

INSTANCE DIA_PC_Thief_DI_Hallo (C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 5;
	condition	= DIA_PC_Thief_DI_Hallo_Condition;
	information	= DIA_PC_Thief_DI_Hallo_Info;

	description = "Siamo arrivati.";
};                       
FUNC INT DIA_PC_Thief_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_PC_Thief_DI_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_PC_Thief_DI_Hallo_15_00"); //Siamo arrivati.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_01"); //Quest'isola non è così lontana da Khorinis come credevo.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_02"); //Non la conoscevo. Ma ora, naturalmente, le cose cominciano a essermi chiare.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_03"); //Mi sono sempre chiesto come gli orchi facessero ad assicurarsi dei rifornimenti così veloci.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_04"); //Con questo avamposto, dev'essere stato facile.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_05"); //Lungo la strada per l'entroterra dell'isola incontrerai probabilmente delle trappole.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_06"); //Se pensi di essere bloccato in qualche punto, torna da me. Forse la mia esperienza potrà aiutarti.
};

// ************************************************************
// 	  	  RAT
// ************************************************************

INSTANCE DIA_PC_Thief_DI_RAT (C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 5;
	condition	= DIA_PC_Thief_DI_RAT_Condition;
	information	= DIA_PC_Thief_DI_RAT_Info;
	permanent	 = 	TRUE;

	description = "Ho bisogno di un tuo consiglio.";
};     
                  
FUNC INT DIA_PC_Thief_DI_RAT_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_PC_Thief_DI_Hallo))
		{
				return TRUE;
		};
};

var int DIA_PC_Thief_DI_RAT_OneTime;
var int DIA_PC_Thief_DI_RAT_OneTime2;
FUNC VOID DIA_PC_Thief_DI_RAT_Info()
{	
	AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_00"); //Ho bisogno di un tuo consiglio.
	
	if (Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI))
	&& (EVT_ORKOBERST_SWITCH_FOUND == FALSE)
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_01"); //Un colonnello degli orchi ha stabilito il suo quartier generale lassù. Non posso più inoltrarmi nell'isola da lì.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_02"); //Gli orchi sono creature astute. Spesso vengono sottovalutati. Immagino che abbiano un passaggio segreto di qualche tipo. Controlla i muri per degli interruttori segreti.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_03"); //Ricorda tuttavia che gli interruttori spesso devono essere attivati in un determinato ordine perché funzionino.
		 
	}
	else if	(Npc_IsDead(FireDragonIsland))
	&& (EVT_DIBRIDGE_OPENED == FALSE)
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_04"); //Ho combattuto con un drago e ora mi trovo di fronte un abisso con un ponte levatoio. Il ponte è stato alzato, e ora non posso attraversarlo.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_05"); //Mmmh. Hai già provato con le armi a distanza? Forse il meccanismo più essere attivato con un colpo mirato.
	}
	else if	(Npc_IsDead(Skeleton_Lord_Archol))
	&& ((Npc_KnowsInfo(other, DIA_Schwarzmagier_HELLO)) == FALSE)
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_06"); //Devo affrontare un gruppo di non morti e le loro complesse trappole.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_07"); //Mi dispiace, non ho esperienza con i non morti. Devi cavartela da solo per questo.
	}
	else
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_08"); //Torna da me quando avrai un problema che la mia esperienza possa risolvere.
		
		 if (ORkSturmDI == TRUE)
		 && (DIA_PC_Thief_DI_RAT_OneTime2 == FALSE)
			{
				AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_09"); //Un'ultima cosa. Preferirei che tu non attirassi tutte le creature che infestano la zona verso la nave. Spero che quell'assalto orchesco sia l'ultimo attacco che mi tocchi respingere!
				B_GivePlayerXP (XP_Ambient);
				DIA_PC_Thief_DI_RAT_OneTime2 = TRUE;
			};	
	};
};

 
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Diego_DI_TRADE		(C_INFO)
{
	npc		 = 	PC_Thief_DI;
	nr          = 12;
	condition	 = 	DIA_Diego_DI_TRADE_Condition;
	information	 = 	DIA_Diego_DI_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;

	description	 = 	"Ho bisogno di munizioni.";
};

func int DIA_Diego_DI_TRADE_Condition ()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Diego_DI_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Diego_DI_TRADE_15_00"); //Ho bisogno di munizioni.
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


	AI_Output			(self, other, "DIA_Diego_DI_TRADE_11_01"); //Forse posso aiutarti.
};

// ************************************************************
// 	  	  Training
// ************************************************************

INSTANCE DIA_PC_Thief_DI_Training_Talente (C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 10;
	condition	= DIA_PC_Thief_DI_Training_Talente_Condition;
	information	= DIA_PC_Thief_DI_Training_Talente_Info;
	permanent	 = 	TRUE;

	description = "Addestrami.";
};                       
FUNC INT DIA_PC_Thief_DI_Training_Talente_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_PC_Thief_DI_Hallo))
	{
		return TRUE;
	};
};

FUNC VOID DIA_PC_Thief_DI_Training_Talente_Info()
{	
	AI_Output (other,self ,"DIA_PC_Thief_DI_Training_15_00"); //Addestrami.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Training_11_01"); //Cosa ti serve?
	
	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Scassinare serrature"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};

	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

//***************************************************************************
// DEX 1
//***************************************************************************

func void DIA_PC_Thief_DI_Training_DEX_1 ()
{
	if (B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX))
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00"); //La tua vita sarà molto più facile se cercherai sempre di stare fuori dalla traiettoria di tiro.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Scassinare serrature"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};

	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

//***************************************************************************
// DEX 5
//***************************************************************************

func void DIA_PC_Thief_DI_Training_DEX_5 ()
{
	if (B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX))
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00"); //Quando ti muovi, cerca di avere sempre in mente la flessibilità di un gatto. Il resto seguirà automaticamente.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Scassinare serrature"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};

	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

//***************************************************************************
// BOGEN
//***************************************************************************
// ------ 1% Waffentalent ------
func void DIA_PC_Thief_DI_Training_Combat_BOW_1()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 100))
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00"); //Per un buon risultato impegnati a fare molta pratica.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Scassinare serrature"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};

	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

// ------ 5% Waffentalent ------
func void DIA_PC_Thief_DI_Training_Combat_BOW_5()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 100))
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00"); //Per tenere ferma la mano, espira piano mentre prendi la mira.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Scassinare serrature"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

// ------ PICKLOCK ------
func void DIA_PC_Thief_DI_Training_Talente_PICKLOCK ()
{
	if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK))
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_PICKLOCK_11_00"); //Era ora. È strano che tu non abbia mai imparato questa abilità prima d'ora.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Scassinare serrature"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};

	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

// ------ Back ------
func void DIA_PC_Thief_DI_Training_Talente_BACK ()
{
	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
};

// ************************************************************
// 	  	  UndeadDragonDead
// ************************************************************

INSTANCE DIA_PC_Thief_DI_UndeadDragonDead (C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 5;
	condition	= DIA_PC_Thief_DI_UndeadDragonDead_Condition;
	information	= DIA_PC_Thief_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;

	description = "È tutto finito. Adesso possiamo andarcene di qui.";
};                       
FUNC INT DIA_PC_Thief_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};
var int DIA_PC_Thief_DI_UndeadDragonDead_OneTime;
FUNC VOID DIA_PC_Thief_DI_UndeadDragonDead_Info()
{	
	AI_Output (other,self ,"DIA_PC_Thief_DI_UndeadDragonDead_15_00"); //È tutto finito. Adesso possiamo andarcene di qui.

	if ((Npc_GetDistToWP(self,"WP_UNDEAD_MIDDLE_01")<4000) )
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_01"); //Guarda lì. Non ho mai visto una simile costruzione in vita mia.
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_02"); //Come diamine hai fatto a passare oltre quella cosa?
		AI_Output (other,self ,"DIA_PC_Thief_DI_UndeadDragonDead_15_03"); //Sono stato fortunato, immagino.
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_04"); //(ride) Se lo dici tu.
	}
	else
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_05"); //Bene.
	};

	if (DIA_PC_Thief_DI_UndeadDragonDead_OneTime == FALSE )
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_UndeadDragonDead_15_06"); //Cosa farai adesso?
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_07"); //È una buona domanda. Penso che come prima cosa tornerò a Khorinis.
		//AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_08"); //Wäre doch gelacht, wenn ich aus dem Dreckloch nicht wieder eine gescheite Stadt ohne Korruption machen kann.
		if (Diebesgilde_Verraten == TRUE)
		|| (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_DiegoDI_Add_11_00"); //Non c'è più una gilda di ladri laggiù. Questo apre alcune interessanti possibilità.
		};
		//AI_Output (self ,other,"DIA_DiegoDI_Add_11_01"); //Für Bromors Haus kann ich bestimmt noch was rausschlagen - vorausgesetzt ich finde einen Käufer...
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_09"); //Mmmh. O forse rileverò gli affari di Bromor. Ci sono sempre parecchi soldi da fare lì. Soldi onesti.
		DIA_PC_Thief_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_10"); //Vai dal capitano ora e andiamocene da qui.
	AI_StopProcessInfos (self);

	if ( Lares_IsOnBoard != LOG_SUCCESS) 
			{
				Npc_ExchangeRoutine	(self, "SittingShipDI");
			}
			else
			{
				Npc_ExchangeRoutine	(self,"Start");		
			};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thief_DI_PICKPOCKET (C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 900;
	condition	= DIA_Thief_DI_PICKPOCKET_Condition;
	information	= DIA_Thief_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Thief_DI_PICKPOCKET_Condition()
{
	C_Beklauen (120, 600);
};
 
FUNC VOID DIA_Thief_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thief_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Thief_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Thief_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thief_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thief_DI_PICKPOCKET_DoIt);
};

func void DIA_Thief_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thief_DI_PICKPOCKET);
};
	
func void DIA_Thief_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thief_DI_PICKPOCKET);
};


