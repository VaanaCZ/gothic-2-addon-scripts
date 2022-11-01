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
	description	= "Je všechno v poâádku?"; 
};                       

FUNC INT DIA_Rod_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Rod_Hello_Info()
{	
	AI_Output (other, self, "DIA_Rod_Hello_15_00"); //Jak se vede?
	if (other.guild != GIL_SLD)
	{
		AI_Output (self, other, "DIA_Rod_Hello_06_01"); //(pohrdavę) Co ode mę chceš, blbečku?
	
			if (other.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Rod_Hello_06_02"); //Nemohli pro tebe najít v klášteâe místo?
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
	description	= "Nemůžeš mę naučit, jak zacházet s obouručními zbranęmi?"; 
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
	AI_Output (other, self, "DIA_Rod_WannaLearn_15_00"); //Nemůžeš mę naučit, jak zacházet s obouručními zbranęmi?
		
	if (Rod_WetteGewonnen == TRUE)
	|| (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_01"); //Nejsem špatný bojovník, ale to neznamená, že jsem dobrý učitel.
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_02"); //Ale i tak ti můžu ukázat základy boje s obouručními zbranęmi.
		
		if (Npc_HasItems (self, ItMw_2h_Rod) == 0)
		{
			AI_Output (self, other, "DIA_Rod_WannaLearn_06_03"); //Tak to jo, pokud mi vrátíš můj meč.
		}
		else
		{
			Rod_Teach2H = TRUE;
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_04"); //Poslouchej, chlapče. K tomu, abys mohl nosit obouruční zbraŕ, potâebuješ mít velkou sílu.
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_05"); //Proč se neodplazíš na pastvinu a nezahraješ si tam s ovečkama chodí pešek okolo?
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
	description = "Chci si zdokonalit své bojové dovednosti v obouručních zbraních!";
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
	AI_Output (other,self, "DIA_Rod_Teach_15_00"); //Chci si zdokonalit své bojové dovednosti v obouručních zbraních!

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
		AI_Output (self ,other,"DIA_Rod_Teach_BACK_06_00"); //Už se začínáš lepšit.
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
	description	= "Chci se pâidat k žoldnéâům!"; 
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
	AI_Output (other, self, "DIA_Rod_WannaJoin_15_00"); //Chci se pâidat k žoldnéâům!
	
	if (Npc_HasItems (self, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_01"); //Takže co kdybys mi pro začátek vrátil zpátky můj meč, co?
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
		{	
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_02"); //Fajn. Nemám nic proti tomu.
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_03"); //Můžeš bojovat, a to je to, co se počítá.
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_04"); //Vętšina hochů tady si z menších šarvátek mezi pâáteli nedęlá tęžkou hlavu. Na to si brzy zvykneš.
		}
		else //WetteGewonnen
		{
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_05"); //No dobâe, máš poâádný meč. Zbytek se naučíš.
		};
		
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_06"); //Co se mę týče, tak já tę beru.
		B_LogEntry (TOPIC_SLDRespekt,"Budu-li se chtít pâipojit k žoldnéâům, Rod se za mę pâimluví.");
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_07"); //Tady není místo pro žádnýho strašpytla!
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
	description	= "Vypadá to, že ti budu muset ukázat nękolik triků, že jo?"; 
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
	AI_Output (other, self, "DIA_Rod_Duell_15_00"); //Vypadá to, že ti budu muset ukázat nękolik triků, že jo?
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other, "DIA_Rod_Duell_06_01"); //No tak to zkus!
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_Duell_06_02"); //Ty se tohle stęží naučíš!
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
	description	= "Jsem dost silnej!"; 
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
	AI_Output (other, self, "DIA_Rod_StarkGenug_15_00"); //Jsem dost silnej!
	AI_Output (self, other, "DIA_Rod_StarkGenug_06_01"); //Blbost! Ty bys nemohl uzvednout dokonce ani meč, jako je ten můj!
	
	Log_CreateTopic (Topic_RodWette,LOG_MISSION);
	Log_SetTopicStatus (Topic_RodWette,LOG_RUNNING);
	B_LogEntry (Topic_RodWette,"Žoldnéâ Rod si myslí, že nedokážu uzvednout jeho meč.");
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
	description	= "Âekl jsem, že JSEM dost silnej!"; 
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
	AI_Output (other, self, "DIA_Rod_BINStarkGenug_15_00"); //Âekl jsem, že JSEM dost silnej!
	AI_Output (self, other, "DIA_Rod_BINStarkGenug_06_01"); //Chacháa, asi umâu smíchy. Chceš se vsadit?
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
	description	= "Vsadím se, že zvládnu tvůj meč!"; 
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
	AI_Output (other, self, "DIA_Rod_Wette_15_00"); //Vsadím se, že zvládnu tvůj meč!
	AI_Output (self, other, "DIA_Rod_Wette_06_01"); //Opravdu? Hmm... (pâemýšlí) O kolik se vsadíme?
	AI_Output (self, other, "DIA_Rod_Wette_06_02"); //No vypadáš, jako ubohej začátečník. Vsaëme se o 30 zlatých! Máš vůbec tolik?
		
	Info_ClearChoices (DIA_Rod_Wette);
	Info_AddChoice (DIA_Rod_Wette, "Ne.", DIA_Rod_Wette_No);
	Info_AddChoice (DIA_Rod_Wette, "Jasnę.", DIA_Rod_Wette_Yes);
	
	B_LogEntry (Topic_RodWette,"Rod se se mnou vsadil o 30 zlaăáků, že neuzvednu jeho meč.");
};

func void DIA_Rod_Wette_No()
{
	AI_Output (other, self, "DIA_Rod_Wette_No_15_00"); //Ne.
	AI_Output (self, other, "DIA_Rod_Wette_No_06_01"); //No, tak vypadni.
	
	Info_ClearChoices (DIA_Rod_Wette);
};
	
func void DIA_Rod_Wette_Yes()
{
	AI_Output (other, self, "DIA_Rod_Wette_Yes_15_00"); //Jasnę.
	AI_Output (self, other, "DIA_Rod_Wette_Yes_06_01"); //Nejdâív se kouknu...
	
	if (B_GiveInvItems (other,self, itmi_gold, 30))
	{
		Rod_WetteAngenommen = TRUE;
			
		AI_Output (other, self, "DIA_Rod_Wette_Yes_15_02"); //Tady jsou!
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_03"); //(škodolibę) V poâádku, podíváme se teda, jak si silnej...
		
		B_GiveInvItems (self, other, ItMw_2h_Rod, 1);
		
		if (other.attribute[ATR_STRENGTH] >= 30)
		{
			AI_UnequipWeapons 		(other);
			AI_EquipBestMeleeWeapon	(other);
			AI_ReadyMeleeWeapon		(other);
							
			AI_Output (other, self, "DIA_Rod_Wette_Yes_15_04");//Tak co âíkáš na mojí sílu?!
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_05");//(zmatený) Vypadá to, žes mę dostal.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_06");//Tohle jsem vůbec nečekal. Opravdu nevypadáš na to, že máš v sobę tolik síly.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_07");//No - âekl bych, že jsem právę pâišel o 30 zlatých. Tady jsou.
			B_GiveInvItems (self, other, itmi_gold, 60);
			Rod_WetteGewonnen = TRUE;
			B_GivePlayerXP (XP_Rod); 
		}
		else
		{
			AI_Output (other, self, "DIA_Rod_Wette_Yes_15_08"); //Tuhle zbraŕ neudržím.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_09");//(smęje se) To ti pâece âíkám!
		};
		
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_10");//A teë mi dej zpátky můj meč.
		
		Info_ClearChoices (DIA_Rod_Wette);
		
		//Npc_RemoveInvItems (other,ItMw_2h_Rod,((Npc_HasItems (other,ItMw_2h_Rod))-1));		//Hoshi: Wilder HAck bitte stehen lassen!
		// Mike: AAAARGH!!!! genau DAS war der Fehler!!!
			
		Info_AddChoice (DIA_Rod_Wette, "Myslím, že ne.", DIA_Rod_Wette_KeepIt);
		Info_AddChoice (DIA_Rod_Wette, "Tumáš.", DIA_Rod_Wette_GiveBack);
	}
	else
	{
		AI_Output (other, self, "DIA_Rod_Wette_Yes_15_11"); //Kam jsem ho tak mohl dát...
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_12"); //To dává smysl. Vraă se zpátky, až budeš mít peníze na sázku.
		
		Info_ClearChoices (DIA_Rod_Wette);
	};
};

func void DIA_Rod_Wette_GiveBack()
{
	AI_RemoveWeapon (other);
	AI_Output (other, self, "DIA_Rod_Wette_GiveBack_15_00"); //Tumáš.
	Info_ClearChoices (DIA_Rod_Wette);
	Info_AddChoice (DIA_Rod_Wette, "(pâedat mu zbraŕ)", DIA_Rod_Wette_GiveBack2);
};

func void DIA_Rod_Wette_GiveBack2()
{
	B_GiveInvItems (other, self, ItMw_2h_Rod, 1);		
	if (Rod_WetteGewonnen == FALSE)
	{
		AI_Output (self, other, "DIA_Rod_Wette_GiveBack_06_01"); //Nakonec nejsi stejnę nic jinýho než strašpytel!
	};
	Info_ClearChoices (DIA_Rod_Wette);
};

func void DIA_Rod_Wette_KeepIt()
{
	AI_Output (other, self, "DIA_Rod_Wette_KeepIt_15_00"); //Myslím, že ne.
	AI_Output (self, other, "DIA_Rod_Wette_KeepIt_06_01"); //(výhružnę) Co to bylo?
	AI_Output (other, self, "DIA_Rod_Wette_KeepIt_15_02"); //Myslím, že si ho ještę  chvíli nechám.
	AI_Output (self, other, "DIA_Rod_Wette_KeepIt_06_03"); //Počkej, ty parchante!
	
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
	description	= "Tady máš meč zpátky!"; 
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
	
	AI_Output (other, self, "DIA_Rod_GiveItBack_15_00"); //Tady máš meč zpátky!
	AI_Output (self, other, "DIA_Rod_GiveItBack_06_01"); //Byl nejvyšší čas!
	
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
	description	= "Jak to jde?"; 
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
	AI_Output (other, self, "DIA_Rod_PERM_15_00"); //Jak se vede?
	
	if (Kapitel <= 2)	
	{
		if (other.guild == GIL_NONE)
		{
			if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
			&& (Rod_WetteGewonnen == FALSE)
			{
				AI_Output (self, other, "DIA_Rod_PERM_06_01"); //To tę nemusí zajímat, padavko.
				Rod_SchwachGesagt = TRUE;
			}
			else
			{
				AI_Output (self, other, "DIA_Rod_PERM_06_02"); //Jsem zvędavý, jestli ti dovolí se k nim pâidat.
			};
		}
		else if (other.guild == GIL_SLD)
		|| 		(other.guild == GIL_DJG)
		{
			AI_Output (self, other, "DIA_Rod_PERM_06_03"); //Jsi jedním z nás, chlapče. Tak se nęjak dohodneme.
		}
		else
		{
			AI_Output (self, other, "DIA_Rod_PERM_06_04"); //Ty sem nepatâíš, radši by ses męl jít poflakovat nękam jinam!
		};
	}

	if (Kapitel >= 3)
	{
		AI_Output (self, other, "DIA_Rod_PERM_06_05"); //Jestli jsou všechny ty povídačky o dracích skutečnę pravdivé, męli bychom dát pár lidí dohromady a jít ty mrchy pozabíjet!
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
	
	
