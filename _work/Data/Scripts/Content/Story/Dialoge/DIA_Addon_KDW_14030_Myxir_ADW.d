
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Myxir_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14030_Addon_Myxir_ADW;
	nr          = 999;
	condition   = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Myxir_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14030_Addon_Myxir_ADW;
	nr			= 900;
	condition	= DIA_Addon_Myxir_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Myxir_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Myxir_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Myxir_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Myxir_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Myxir_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Myxir_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Myxir_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_ADWHello_Condition;
	information	 = 	DIA_Addon_Myxir_ADWHello_Info;

	description	 = 	"Objevili jste nêco nového?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //Nêjaké nové objevy?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //Stavitelé tohoto dávného mêsta mê fascinují!
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //Škoda že jejich jazyk je stejnê mrtvý jako oni.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //(rozvážnê) Zachránit je mohly pouze mocné obâady a vyvolávací rituály, které ovládali.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //Vyvolávací rituály?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //Stavitelé byli silnê napojeni na duchovní svêt.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //Pokud jsem to dobâe pochopil, vêâili, že jsou v neustálém kontaktu se svými pâedky.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //Pravidelnê poâádali obâady, pâi nichž vyvolávali duchy svých pâedkù a žádali je o radu a osvícení.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "A jak to vyvolávání duchù funguje?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Nemrtví, které znám, toho obvykle moc nenamluví.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //A jak to vyvolávání duchù funguje?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //Strážci smrti mêli zvláštní formule, kterými ovládali duchy.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //Ale nápisy, které jsem tu našel, mê trochu matou. Jen vzácnê v nich najdu jasnou odpovêë na své otázky.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //Nemrtví, které znám, nikdy nemêli mnoho co âíct.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //Stavitelé ale nevytváâeli bezduché nemrtvé jako zombie nebo podobné stvùry.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //Šlo o duchy velkých váleèníkù, knêzù a vládcù.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //Zatím nepochybuji, že skuteènê existovali.
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_PermADW		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Myxir_PermADW_Condition;
	information	 = 	DIA_Addon_Myxir_PermADW_Info;
	permanent	 = 	TRUE;

	description	 = 	"Kdybych nêkdy nêjakého ducha potkal, dám ti vêdêt.";
};
func int DIA_Addon_Myxir_PermADW_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
	&& (Saturas_RiesenPlan == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_PermADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //Až uvidím ducha, dám ti vêdêt.
	AI_Output	(self, other, "DIA_Addon_Myxir_PermADW_12_01"); //(smêje se) Ano, na tom trvám.
};
///////////////////////////////////////////////////////////////////////
//	Info GeistTafel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistTafel		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistTafel_Condition;
	information	 = 	DIA_Addon_Myxir_GeistTafel_Info;

	description	 = 	"Posílá mê Saturas.";
};

func int DIA_Addon_Myxir_GeistTafel_Condition ()
{
	if (Saturas_RiesenPlan == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistTafel_Info ()
{
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //Posílá mê Saturas.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //Havran se dostal do chrámu a zablokoval portál zevnitâ.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //Saturas si myslí, že informaci o tom chrámu získal od ducha.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //(zaraženê) Pâi Adanovi! 
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //Urèitê vyvolal veleknêze Khardimona a ptal se ho na cestu do chrámu.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //Podle záznamù je jeho hrob v jeskyních pod pevností.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //A ty udêláš to samé.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //Ale Khardimona už se dál ptát nemùžeš.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //Hrob prince-váleèníka Quarhodrona by mêl být na západê údolí.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //Budeš ho muset najít a Quarhodrona probudit.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //Tyto nápisy hovoâí o tom, že ducha mùže vyvolat pouze ten, kdo vêâí v Adana.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //Vážnê myslíš, že to bude fungovat?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //Už jsem pâeèetl spoustu šílených blábolù.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //Napâíklad záznamy Y'Beriona, vùdce Spáèova bratrstva.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //Ale autorovi TÊCHTO záznamù vêâím každé slovo.
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "To myslíš vážnê?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Proè Quarhodron? Proè ne veleknêz Khardimon?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Bratrstvo Spáèe nehlásalo JENOM lži.", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //Proè Quarhodron? Proè ne veleknêz Khardimon?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //Havran tím vyvoláváním Khardimonovu hrobku znesvêtil. To musíme brát v potaz.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //Budeme se muset poohlédnout po jiném duchovi.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //Spáèovo bratrstvo nešíâilo POUZE lži. Spáè opravdu existoval.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //Ale jejich lži nebyly tak nepravdêpodobné jako samotná jejich slova.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //Byli tak zmatení, že si to ani nedovedeš pâedstavit. Kouâili moc té své trávy z bažin.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //Slova na této kamenné tabulce hovoâí vážnê a prozíravê. A to mê utvrzuje v pâesvêdèení, že TENTO èlovêk hovoâil pravdu.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //To opravdu myslíš vážnê?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //Chci prošetâit každou možnost.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //Je to jediná pâíležitost, jak se setkat s jedním ze stavitelù – i když je to pouze duch. Tak proè jí nevyužít.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //Havran to každopádnê dokázal.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Âeknême, že bych chtêl toho ducha vyvolat...", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //Co musím udêlat, abych toho ducha vyvolal?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //Quarhodronùv hrob najdeš na západê údolí.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //Jeho ducha lze vyvolat slovy strážcù smrti, která jsem ti tu napsal.
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //To je všechno. Teë zbývá už jen najít hrob.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //Hodnê štêstí, synu.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Myxir chce, abych probudil ducha prince Quarhodrona a požádal ho o radu. Dal mi svitek se zaklínadlem, které mám nahlas pâeèíst u Quarhodronova hrobu na západê."); 

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
};

///////////////////////////////////////////////////////////////////////
//	Info GeistPerm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistPerm		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistPerm_Condition;
	information	 = 	DIA_Addon_Myxir_GeistPerm_Info;

	description	 = 	"Mùžeš mi ještê zopakovat, co to bylo s tím váleènickým princem Quarhodronem?";
};

func int DIA_Addon_Myxir_GeistPerm_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistPerm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistPerm_15_00"); //Mùžeš mi ještê zopakovat, jak to bylo s princem Quarhodronem?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //Musíš najít jeho hrob a slovy strážcù smrti vyvolat jeho ducha.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //Ta slova jsem ti tady zapsal. Staèí je nahlas pâeèíst.
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Myxir_TalkedToGhost_Info;

	description	 = 	"Hovoâil jsem s Quarhodronem.";
};
func int DIA_Addon_Myxir_TalkedToGhost_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
	&& (SC_TalkedToGhost == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //Hovoâil jsem s Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //(nadšenê) Takže jsi ho doopravdy probudil z mrtvých?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //To je neuvêâitelné. Ti stavitelé mê èím dál víc pâekvapují.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //Kdo ví, co mohli dokázat, kdyby ještê existovali.
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //A co ten duch povídal?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //Dal mi nêco, co mi pomùže dostat se do Adanova chrámu.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //Pak bêž rovnou za Saturasem. Tvé informace ho urèitê budou zajímat.

		B_LogEntry (TOPIC_Addon_Quarhodron,"Mêl bych Saturasovi oznámit, že jsem probudil Quarhodrona."); 
	};
};

///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADW_Teach		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Myxir_ADW_Teach_Condition;
	information	 = 	DIA_Addon_Myxir_ADW_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nauè mê tomu jazyku.";
};

var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

func int DIA_Addon_Myxir_ADW_Teach_Condition ()
{
	if (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)	
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_ADW_Teach_Info ()
{
	B_DIA_Addon_Myxir_TeachRequest ();

	if (DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach); 
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};	
	
	if ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)	
	{
		Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,DIALOG_BACK,DIA_Addon_Myxir_ADW_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL2 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL3 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else 
	{
		B_DIA_Addon_Myxir_TeachNoMore ();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X ();
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1 ()
{
	if (B_TeachPlayerTalentForeignLanguage  (self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};

















