// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Rod_EXIT(C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 999;
	condition	= DIA_Rod_EXIT_Condition;
	information	= DIA_Rod_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rod_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rod_EXIT_Info()
{	
	AI_EquipBestMeleeWeapon(self); 
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************

instance DIA_Rod_Hello (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 1;
	condition	= DIA_Rod_Hello_Condition;
	information	= DIA_Rod_Hello_Info;
	permanent	= FALSE;
	description	= "Va tutto bene?"; 
};                       

FUNC INT DIA_Rod_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Rod_Hello_Info()
{	
	AI_Output (other, self, "DIA_Rod_Hello_15_00"); //Come vanno le cose?
	if (other.guild != GIL_SLD)
	{
		AI_Output (self, other, "DIA_Rod_Hello_06_01"); //(scocciato) Cosa vuoi TU da me, rompiscatole?
	
			if (other.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Rod_Hello_06_02"); //Non ti hanno trovato una stanza nel monastero?
			};	
	};
};

// ************************************************************
// 			  					WannaLearn 
// ************************************************************
var int Rod_SchwachGesagt;

instance DIA_Rod_WannaLearn (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 2;
	condition	= DIA_Rod_WannaLearn_Condition;
	information	= DIA_Rod_WannaLearn_Info;
	permanent	= TRUE;
	description	= "Puoi insegnarmi a usare le armi a due mani?"; 
};                       

FUNC INT DIA_Rod_WannaLearn_Condition()
{
	if (Rod_Teach2H == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_WannaLearn_Info()
{	
	AI_Output (other, self, "DIA_Rod_WannaLearn_15_00"); //Puoi insegnarmi a usare le armi a due mani?
		
	if (Rod_WetteGewonnen == TRUE)
	|| (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_01"); //Non sono un cattivo guerriero, ma questo non significa che io sia un buon insegnante.
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_02"); //Tuttavia, penso di poterti comunque mostrare le basi del combattimento con le armi a due mani.
		
		if (Npc_HasItems (self, ItMw_2h_Rod) == 0)
		{
			AI_Output (self, other, "DIA_Rod_WannaLearn_06_03"); //Naturalmente, solo se mi darai indietro la mia spada.
		}
		else
		{
			Rod_Teach2H = TRUE;
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_04"); //Ascolta, ragazzo. Ci vuole molta forza per brandire un'arma a due mani.
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_05"); //Perché non vai a farti un giro sui pascoli e a giocare a girotondo con le pecore?
		Rod_SchwachGesagt = TRUE;
	};
};

// ******************************************************
//							Teach
// ******************************************************
var int Rod_Merke_2h;
// ------------------------------------------------------

INSTANCE DIA_Rod_Teach(C_INFO)
{
	npc			= SLD_804_Rod;
	nr			= 3;
	condition	= DIA_Rod_Teach_Condition;
	information	= DIA_Rod_Teach_Info;
	permanent	= TRUE;
	description = "Voglio migliorare le mie abilità di combattimento a due mani!";
};                       

FUNC INT DIA_Rod_Teach_Condition()
{
	if (Rod_Teach2H == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_Teach_Info()
{	
	AI_Output (other,self, "DIA_Rod_Teach_15_00"); //Voglio migliorare le mie abilità di combattimento a due mani!

	Rod_Merke_2h = other.HitChance[NPC_TALENT_2H];
	
	Info_ClearChoices (DIA_Rod_Teach);
	Info_AddChoice (DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Rod_Teach_2H_1);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Rod_Teach_2H_5);
};

FUNC VOID DIA_Rod_Teach_Back ()
{
	if (Rod_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output (self ,other,"DIA_Rod_Teach_BACK_06_00"); //Stai già migliorando.
	};
	
	Info_ClearChoices (DIA_Rod_Teach);
};

FUNC VOID DIA_Rod_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);
	
	Info_ClearChoices (DIA_Rod_Teach);
	Info_AddChoice (DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Rod_Teach_2H_1);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Rod_Teach_2H_5);
};

FUNC VOID DIA_Rod_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
	
	Info_ClearChoices (DIA_Rod_Teach);
	Info_AddChoice (DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Rod_Teach_2H_1);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Rod_Teach_2H_5);
};

// ************************************************************
// 			  					WannaJoin 
// ************************************************************

instance DIA_Rod_WannaJoin (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 4;
	condition	= DIA_Rod_WannaJoin_Condition;
	information	= DIA_Rod_WannaJoin_Info;
	permanent	= TRUE;
	description	= "Voglio unirmi ai mercenari!"; 
};                       

FUNC INT DIA_Rod_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Rod_WannaJoin_15_00"); //Voglio unirmi ai mercenari!
	
	if (Npc_HasItems (self, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_01"); //Allora che ne dici di ridarmi la spada prima, eh?
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
		{	
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_02"); //D'accordo, non serbo rancore.
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_03"); //Sai combattere e questo è quello che conta.
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_04"); //La maggior parte dei miei compagni non pensa ad altro che a una piccola rissa tra amici. Ti ci abituerai.
		}
		else //WetteGewonnen
		{
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_05"); //Oh, beh, impugni una spada decente. Il resto lo imparerai.
		};
		
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_06"); //Per quanto mi riguarda, sei dentro.
		B_LogEntry (TOPIC_SLDRespekt,"Otterrò il voto di Rod se deciderò di unirmi ai mercenari.");
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_07"); //Non c'è posto per i deboli qui!
		Rod_SchwachGesagt = TRUE;
	};
};

// ************************************************************
// 			  					Duell 
// ************************************************************

instance DIA_Rod_Duell (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 6;
	condition	= DIA_Rod_Duell_Condition;
	information	= DIA_Rod_Duell_Info;
	permanent	= TRUE;
	description	= "Sembra che ti debba insegnare le buone maniere, o sbaglio?"; 
};                       

FUNC INT DIA_Rod_Duell_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		if (Rod_WetteGewonnen == FALSE)
		&& (Rod_SchwachGesagt == TRUE)
		{
			return TRUE;
		};
	
		if (Mis_Jarvis_SldKO == LOG_RUNNING)
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Rod_Duell_Info()
{	
	AI_Output (other, self, "DIA_Rod_Duell_15_00"); //Sembra che ti debba insegnare le buone maniere, o sbaglio?
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other, "DIA_Rod_Duell_06_01"); //Prego, provaci pure!
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_Duell_06_02"); //Non imparerai mai!
	};
	
	AI_StopProcessInfos(self);
	B_Attack (self, other,AR_NONE, 1);
};	

// ************************************************************
// 			  				StarkGenug 
// ************************************************************

instance DIA_Rod_StarkGenug (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 5;
	condition	= DIA_Rod_StarkGenug_Condition;
	information	= DIA_Rod_StarkGenug_Info;
	permanent	= FALSE;
	description	= "Sono forte abbastanza!"; 
};                       

FUNC INT DIA_Rod_StarkGenug_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Rod_SchwachGesagt == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_StarkGenug_Info()
{	
	AI_Output (other, self, "DIA_Rod_StarkGenug_15_00"); //Sono forte abbastanza!
	AI_Output (self, other, "DIA_Rod_StarkGenug_06_01"); //Sciocchezze! Non sei neanche riuscito a SOLLEVARE una spada decente come la mia!
	
	Log_CreateTopic (Topic_RodWette,LOG_MISSION);
	Log_SetTopicStatus (Topic_RodWette,LOG_RUNNING);
	B_LogEntry (Topic_RodWette,"Rod il mercenario non crede che io possa brandire la sua spada.");
};	
	
	
// ************************************************************
// 			  				BINStarkGenug 
// ************************************************************

instance DIA_Rod_BINStarkGenug (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 5;
	condition	= DIA_Rod_BINStarkGenug_Condition;
	information	= DIA_Rod_BINStarkGenug_Info;
	permanent	= FALSE;
	description	= "Ho detto che SONO forte abbastanza!|"; 
};                       

FUNC INT DIA_Rod_BINStarkGenug_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Rod_StarkGenug))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_BINStarkGenug_Info()
{	
	AI_Output (other, self, "DIA_Rod_BINStarkGenug_15_00"); //Ho detto che SONO forte abbastanza!|
	AI_Output (self, other, "DIA_Rod_BINStarkGenug_06_01"); //Oh, mi fai morire. Vuoi rischiare una piccola scommessa?
};	
	

// ************************************************************
// 			  				Wette
// ************************************************************
var int Rod_WetteGewonnen;
var int Rod_WetteAngenommen;
//-------------------------

instance DIA_Rod_Wette (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 5;
	condition	= DIA_Rod_Wette_Condition;
	information	= DIA_Rod_Wette_Info;
	permanent	= TRUE;
	description	= "Scommetto che sarei in grado di maneggiare la tua spada!"; 
};                       

FUNC INT DIA_Rod_Wette_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Rod_BINStarkGenug))
	&& (Npc_HasItems (self, ItMw_2h_Rod) > 0)
	&& (Rod_WetteAngenommen == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_Wette_Info()
{	
	AI_Output (other, self, "DIA_Rod_Wette_15_00"); //Scommetto che sarei in grado di maneggiare la tua spada!
	AI_Output (self, other, "DIA_Rod_Wette_06_01"); //Davvero? Mmmh... (riflettendo) Quanto ti dovrei sottrarre?
	AI_Output (self, other, "DIA_Rod_Wette_06_02"); //Beh, sembri un pessimo perdente. Facciamo 30 pezzi d'oro! Li hai?
		
	Info_ClearChoices (DIA_Rod_Wette);
	Info_AddChoice (DIA_Rod_Wette, "No.", DIA_Rod_Wette_No);
	Info_AddChoice (DIA_Rod_Wette, "Certo.", DIA_Rod_Wette_Yes);
	
	B_LogEntry (Topic_RodWette,"Rod vuole scommettere 30 pezzi d'oro che non riuscirò a brandire la sua spada.");
};

func void DIA_Rod_Wette_No()
{
	AI_Output (other, self, "DIA_Rod_Wette_No_15_00"); //No.
	AI_Output (self, other, "DIA_Rod_Wette_No_06_01"); //Oh, sparisci allora.
	
	Info_ClearChoices (DIA_Rod_Wette);
};
	
func void DIA_Rod_Wette_Yes()
{
	AI_Output (other, self, "DIA_Rod_Wette_Yes_15_00"); //Certo.
	AI_Output (self, other, "DIA_Rod_Wette_Yes_06_01"); //Vediamo allora...
	
	if (B_GiveInvItems (other,self, itmi_gold, 30))
	{
		Rod_WetteAngenommen = TRUE;
			
		AI_Output (other, self, "DIA_Rod_Wette_Yes_15_02"); //Ecco!
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_03"); //(esultante) D'accordo, vediamo quanto sei forte...
		
		B_GiveInvItems (self, other, ItMw_2h_Rod, 1);
		
		if (other.attribute[ATR_STRENGTH] >= 30)
		{
			AI_UnequipWeapons 		(other);
			AI_EquipBestMeleeWeapon	(other);
			AI_ReadyMeleeWeapon		(other);
							
			AI_Output (other, self, "DIA_Rod_Wette_Yes_15_04");//Forte circa così?!?
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_05");//(perplesso) Sembra che tu mi abbia fregato.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_06");//Non me la sarei mai aspettato. Non sembri veramente avere tutta quella forza in te.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_07");//Bene, penso di avere appena perso 30 pezzi d'oro. Eccoteli.
			B_GiveInvItems (self, other, itmi_gold, 60);
			Rod_WetteGewonnen = TRUE;
			B_GivePlayerXP (XP_Rod); 
		}
		else
		{
			AI_Output (other, self, "DIA_Rod_Wette_Yes_15_08"); //Non riesco a brandire quest'arma.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_09");//(ride) È quello che ti dicevo!
		};
		
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_10");//E ora ridammi la mia arma.
		
		Info_ClearChoices (DIA_Rod_Wette);
		
		//Npc_RemoveInvItems (other,ItMw_2h_Rod,((Npc_HasItems (other,ItMw_2h_Rod))-1));		//Hoshi: Wilder HAck bitte stehen lassen!
		// Mike: AAAARGH!!!! genau DAS war der Fehler!!!
			
		Info_AddChoice (DIA_Rod_Wette, "Non credo...", DIA_Rod_Wette_KeepIt);
		Info_AddChoice (DIA_Rod_Wette, "Ecco.", DIA_Rod_Wette_GiveBack);
	}
	else
	{
		AI_Output (other, self, "DIA_Rod_Wette_Yes_15_11"); //Dove li ho messi...
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_12"); //Ti pareva. Torna quando avrai l'oro per scommettere.
		
		Info_ClearChoices (DIA_Rod_Wette);
	};
};

func void DIA_Rod_Wette_GiveBack()
{
	AI_RemoveWeapon (other);
	AI_Output (other, self, "DIA_Rod_Wette_GiveBack_15_00"); //Ecco.
	Info_ClearChoices (DIA_Rod_Wette);
	Info_AddChoice (DIA_Rod_Wette, "(passagli l'arma)", DIA_Rod_Wette_GiveBack2);
};

func void DIA_Rod_Wette_GiveBack2()
{
	B_GiveInvItems (other, self, ItMw_2h_Rod, 1);		
	if (Rod_WetteGewonnen == FALSE)
	{
		AI_Output (self, other, "DIA_Rod_Wette_GiveBack_06_01"); //Non sei altro che un debole dopo tutto!
	};
	Info_ClearChoices (DIA_Rod_Wette);
};

func void DIA_Rod_Wette_KeepIt()
{
	AI_Output (other, self, "DIA_Rod_Wette_KeepIt_15_00"); //Non credo...
	AI_Output (self, other, "DIA_Rod_Wette_KeepIt_06_01"); //(minaccioso) Cos'hai detto?
	AI_Output (other, self, "DIA_Rod_Wette_KeepIt_15_02"); //Credo che la terrò ancora un po'.
	AI_Output (self, other, "DIA_Rod_Wette_KeepIt_06_03"); //Aspetta e vedrai, maledetto!
	
	Info_ClearChoices (DIA_Rod_Wette);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1); 
};


// ************************************************************
// 			  				Schwert zurück
// ************************************************************
var int Rod_SchwertXPGiven;

instance DIA_Rod_GiveItBack (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 7;
	condition	= DIA_Rod_GiveItBack_Condition;
	information	= DIA_Rod_GiveItBack_Info;
	permanent	= TRUE;
	description	= "Riecco la tua spada!"; 
};                       

FUNC INT DIA_Rod_GiveItBack_Condition()
{
	if (Npc_HasItems (other, ItMw_2h_Rod) > 0)
	{	
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_GiveItBack_Info()
{	
	B_GiveInvItems (other, self, ItMw_2h_Rod, 1);
	
	AI_Output (other, self, "DIA_Rod_GiveItBack_15_00"); //Riecco la tua spada!
	AI_Output (self, other, "DIA_Rod_GiveItBack_06_01"); //Era ora!
	
	if (Rod_SchwertXPGiven == FALSE)
	{
		B_GivePlayerXP (XP_Ambient);
		Rod_SchwertXPGiven = TRUE;
	};
};

// ************************************************************
// 			  					PERM
// ************************************************************

instance DIA_Rod_PERM (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 1;
	condition	= DIA_Rod_PERM_Condition;
	information	= DIA_Rod_PERM_Info;
	permanent	= TRUE;
	description	= "Cosa succede?"; 
};                       

FUNC INT DIA_Rod_PERM_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Rod_Hello))
	{	
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_PERM_Info()
{	
	AI_Output (other, self, "DIA_Rod_PERM_15_00"); //Come va?
	
	if (Kapitel <= 2)	
	{
		if (other.guild == GIL_NONE)
		{
			if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
			&& (Rod_WetteGewonnen == FALSE)
			{
				AI_Output (self, other, "DIA_Rod_PERM_06_01"); //Non sono affari tuoi, donnicciola.
				Rod_SchwachGesagt = TRUE;
			}
			else
			{
				AI_Output (self, other, "DIA_Rod_PERM_06_02"); //Sono curioso di vedere se ti permetteranno di unirti a noi.
			};
		}
		else if (other.guild == GIL_SLD)
		|| 		(other.guild == GIL_DJG)
		{
			AI_Output (self, other, "DIA_Rod_PERM_06_03"); //Sei uno di noi ora, ragazzo. Ci abitueremo col tempo.
		}
		else
		{
			AI_Output (self, other, "DIA_Rod_PERM_06_04"); //Non sei il benvenuto qui, faresti meglio a passeggiare da qualche altra parte!
		};
	}

	if (Kapitel >= 3)
	{
		AI_Output (self, other, "DIA_Rod_PERM_06_05"); //Se tutte queste storie sui draghi fossero vere, dovremmo riunire un po' di gente e andare a trucidare quelle bestiacce!
	};

	//### ab Kap 4 in OW ###
};

	
	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_RodSLD_PICKPOCKET (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 900;
	condition	= DIA_RodSLD_PICKPOCKET_Condition;
	information	= DIA_RodSLD_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_RodSLD_PICKPOCKET_Condition()
{
	C_Beklauen (15, 35);
};
 
FUNC VOID DIA_RodSLD_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_RodSLD_PICKPOCKET);
	Info_AddChoice		(DIA_RodSLD_PICKPOCKET, DIALOG_BACK 		,DIA_RodSLD_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_RodSLD_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_RodSLD_PICKPOCKET_DoIt);
};

func void DIA_RodSLD_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_RodSLD_PICKPOCKET);
};
	
func void DIA_RodSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_RodSLD_PICKPOCKET);
};






	
	
	




	
	
		



	
	
		
		







	
	//NUR Bis Kapitel 3!
	
	/**/
	
	
