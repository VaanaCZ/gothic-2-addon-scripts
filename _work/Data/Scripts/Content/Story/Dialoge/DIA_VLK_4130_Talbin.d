///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talbin_EXIT   (C_INFO)
{
	npc         = VLK_4130_Talbin;
	nr          = 999;
	condition   = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talbin_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Talbin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
var int Talbin_Runs;
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_HALLO		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 5;
	condition	 = 	DIA_Talbin_HALLO_Condition;
	information	 = 	DIA_Talbin_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Talbin_HALLO_Condition ()
{
	if (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Talbin_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_00"); //Stùj! Ani hnout!
	AI_Output			(other, self, "DIA_Talbin_HALLO_15_01"); //Jo! Jenom klid!
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_02"); //No to mê podrž! Další ztracená voveèka, co? Nejdâív jsem tê mêl za jednoho z têch hnusnejch šmejdù, co tu poâád vopruzujou.
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_03"); //Ale vidím, že k nim nejspíš nepatâíš. Na to pùsobíš až moc neškodnê!
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachtIhr
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WASMACHTIHR		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 6;
	condition	 = 	DIA_Talbin_WASMACHTIHR_Condition;
	information	 = 	DIA_Talbin_WASMACHTIHR_Info;

	description	 = 	"Vypadáš jako lovec, který neví, co s èasem.";
};

func int DIA_Talbin_WASMACHTIHR_Condition ()
{
	if (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WASMACHTIHR_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_15_00"); //Vypadáš jak lovec, který neví, co s èasem.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_01"); //Ha-ha! Jo - jedna nula pro tebe. Ale co mám dêlat - pâes prùsmyk se vrátit nemùžu!
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_02"); //Tak tu prostê trèím a dêlám, co se dá.

	if ((Npc_IsDead(Engrom)) == FALSE)
	{
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_03"); //Je mi ale líto mýho kámoše Engroma.
	};

	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_04"); //Pojë blíž k vohni a vohâej se.
	
	Info_ClearChoices	(DIA_Talbin_WASMACHTIHR);
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, DIALOG_BACK, DIA_Talbin_WASMACHTIHR_back );
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, "Ale nevypadáš, že by se ti daâilo nêjak špatnê.", DIA_Talbin_WASMACHTIHR_gut );
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, "Ty jsi bývalý vêzeà z kolonie?", DIA_Talbin_WASMACHTIHR_strf );

};
func void DIA_Talbin_WASMACHTIHR_back ()
{
	Info_ClearChoices	(DIA_Talbin_WASMACHTIHR);
};

func void DIA_Talbin_WASMACHTIHR_strf ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_strf_15_00"); //Ty jsi bývalý vêzeà?
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_01"); //Ne, kdepak! Co si myslíš? Vlastnê jsem se tady chtêl jenom trochu napakovat.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_02"); //Nêkdo mi napovídal, že v têchhle konèinách ulovím spoustu vêcí.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_03"); //Že je to tu prostê bohatý na všecko, jestli víš, co myslím.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_04"); //Ale vod tý doby, co se tu objevili ti zatracení skâeti, tu mùžeš dostat tak akorát pár pâes èuàu, když náhodou popojdeš trochu dál!
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_05"); //A ti pitomci mê tu nechali poâádnê vydusit.
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_strf_15_06"); //Takové vtipálky moc dobâe znám!
};

func void DIA_Talbin_WASMACHTIHR_gut ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_gut_15_00"); //Ale nevypadáš, že by se ti daâilo nêjak špatnê.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_gut_07_01"); //No, mohlo to být horší - myslím, že si nemùžu stêžovat. I pâes ty zatracený skâety je oblast kolem âeky nejmíà nebezpeèná.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_gut_07_02"); //Vypadá to, že si netroufají moc blízko k vodê, ale možná je to jenom náhoda.
};


///////////////////////////////////////////////////////////////////////
//	Info SorryForEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_SORRYFORENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 7;
	condition	 = 	DIA_Talbin_SORRYFORENGROM_Condition;
	information	 = 	DIA_Talbin_SORRYFORENGROM_Info;

	description	 = 	"Proè je ti Engroma líto?";
};

func int DIA_Talbin_SORRYFORENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& ((Npc_IsDead(Engrom)) == FALSE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Kapitel <= 3)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_SORRYFORENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_SORRYFORENGROM_15_00"); //Proè je ti Engroma líto?
	AI_Output			(self, other, "DIA_Talbin_SORRYFORENGROM_07_01"); //Protože šel prostê se mnou, a to úplnê bez âeèí.
	AI_Output			(self, other, "DIA_Talbin_SORRYFORENGROM_07_02"); //A teë jsme se dostali do tohohle svrabu. Chamtivost se holt nevyplácí.
};


///////////////////////////////////////////////////////////////////////
//	Info WasJagdIhr
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WASJAGDIHR		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 8;
	condition	 = 	DIA_Talbin_WASJAGDIHR_Condition;
	information	 = 	DIA_Talbin_WASJAGDIHR_Info;

	description	 = 	"Co tady u âeky lovíš?";
};

func int DIA_Talbin_WASJAGDIHR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WASJAGDIHR_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WASJAGDIHR_15_00"); //Co tady u âeky lovíš?
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_01"); //To je ale votázka! Jen se projdi podél koryta a uvidíš, co tu asi tak mùžu lovit. Èíhavce, samozâejmê!
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_02"); //Ty potvory se nechytaj zrovna snadno, ale chutnaj mnohem líp, než se lovêj.
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_03"); //Jednou za èas narazím i na mrchožrouta. A ani nad ním nevohrnuju nos!
};

///////////////////////////////////////////////////////////////////////
//	Info EngromAngry
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_ENGROMANGRY		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 9;
	condition	 = 	DIA_Talbin_ENGROMANGRY_Condition;
	information	 = 	DIA_Talbin_ENGROMANGRY_Info;

	description	 = 	"Myslím, že tvùj kámoš je trošku vydêšený.";
};

func int DIA_Talbin_ENGROMANGRY_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Engrom_WhatAboutLeaving))
			&& (Npc_KnowsInfo(other, DIA_Talbin_SORRYFORENGROM))
			&& ((Npc_IsDead(Engrom)) == FALSE)
			&& (Talbin_FollowsThroughPass == 0)
			&& (Kapitel <= 3)
			&& (Talbin_Runs == FALSE)
		)
		{
				return TRUE;
		};
};

func void DIA_Talbin_ENGROMANGRY_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_ENGROMANGRY_15_00"); //Myslím, že tvùj kámoš je trošku vystresovaný.
	AI_Output			(self, other, "DIA_Talbin_ENGROMANGRY_07_01"); //Nech si toho. Radši ho vùbec neprovokuj, nebo mê pâipraví o hlavu. V téhle vêci už prostê nemùžu nic dêlat.
	AI_Output			(self, other, "DIA_Talbin_ENGROMANGRY_07_02"); //Jednou to ale zvládnu!
};


// ************************************************************
// 			  			  ASK TEACHER 
// ************************************************************

INSTANCE DIA_Talbin_AskTeacher (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr          = 10;
	condition	= DIA_Talbin_AskTeacher_Condition;
	information	= DIA_Talbin_AskTeacher_Info;

	description = "Mùžeš mê nauèit nêco o lovu?";
};                       

FUNC INT DIA_Talbin_AskTeacher_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASJAGDIHR))
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
	{
				return TRUE;
		};
};

FUNC VOID DIA_Talbin_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00"); //Mùžeš mê nauèit nêco o lovu?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01"); //Chápu! Takže jsi dostal taky chuã lovit. No dobâe, ale bude tê to nêco stát!
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02"); //Co za to chceš?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03"); //Nemáš náhodou k jídlu nêco jinýho než èíhavèí maso? Tâeba kus sejra. Jo, dal bych hlavu za kus sejra.
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04"); //Uvidím, co se dá dêlat.
		
	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Talbin mê nauèí, jak ze zvíâat získávat trofeje.");
};


// ************************************************************
// 			  			  PAY TEACHER 
// ************************************************************

INSTANCE DIA_Talbin_PayTeacher (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr          = 11;
	condition	= DIA_Talbin_PayTeacher_Condition;
	information	= DIA_Talbin_PayTeacher_Info;
	permanent	= TRUE;
	description = "Tady máš ten sýr. Budeš mê teë uèit?";
};                       

var int DIA_Talbin_PayTeacher_noPerm;

FUNC INT DIA_Talbin_PayTeacher_Condition()
{
	if 	(
		(Npc_KnowsInfo (other, DIA_Talbin_AskTeacher))
		&& (DIA_Talbin_PayTeacher_noPerm == FALSE)
		&& (Talbin_FollowsThroughPass == 0)
		&& (Talbin_Runs == FALSE)
		)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Talbin_PayTeacher_Info()
{
	if (B_GiveInvItems (other, self, itfo_Cheese, 1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00"); //Tady máš ten sýr. Budeš mê teë uèit?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01"); //Fakt jsi àákej schrastil? Páni, chlape, už je to celý vêky, kdy sem baštil nêco takovýho. Díky. No a co... aha. Nojo. Jasnê!
		Talbin_TeachAnimalTrophy = TRUE;
		DIA_Talbin_PayTeacher_noPerm = TRUE;
	}
	else	//SC hat keinen Käse
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02"); //Teë u sebe zrovna žádný sýr nemám.
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03"); //Je to prostê moc dobrý, než aby to byla pravda. Ale urèitê mi dej vêdêt, až àákej seženeš!
	};
};


///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_TEACHHUNTING		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 12;
	condition	 = 	DIA_Talbin_TEACHHUNTING_Condition;
	information	 = 	DIA_Talbin_TEACHHUNTING_Info;
	permanent	= TRUE;
	description	 = 	"Co mê mùžeš nauèit?";
};

func int DIA_Talbin_TEACHHUNTING_Condition ()
{
	if (Talbin_TeachAnimalTrophy == TRUE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_TEACHHUNTING_15_00"); //Co mê mùžeš nauèit?
		if 	(
				(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			)
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_07_01"); //Co bys rád vêdêl?
		

			Info_AddChoice		(DIA_Talbin_TEACHHUNTING, DIALOG_BACK, DIA_Talbin_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Vyjmutí drápù",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Talbin_TEACHHUNTING_Claws);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Stažení z kùže",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Talbin_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Roh stínové šelmy",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Talbin_TEACHHUNTING_ShadowHorn);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Vyâíznutí srdce",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)),  DIA_Talbin_TEACHHUNTING_Heart);
			};

		}
		else
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_07_02"); //Tak v tom tê musím zklamat. Už znáš všecko, co bych tê mohl nauèit. Ale i tak eštê jednou dêkuju za ten sejr!
		};
};

func void DIA_Talbin_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

// ------ Klauen hacken ------
func void DIA_Talbin_TEACHHUNTING_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_00"); //Drápy vyndáš pomêrnê jednoduše. Prostê každej popadneš pâímo za kloub a pâitlaèíš dólu.
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_01"); //A pak už ho jenom vopatrnê vodâízneš nožem.
		};

		Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Talbin_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_00"); //Èíhavèí kùži nejlehèejc stáhneš tak, že udêláš dlouhej âez podél bâicha...
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_01"); //...pak škubneš za zadní nohy a celou kùži vodzadu dopâedu z tý potvory strhneš.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Shadowhorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00"); //Rohy stínovejch šelem jsou poâádnê tvrdý - vyrábêj se z nich hlavnê sošky a rùzný nástroje.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};
func void DIA_Talbin_TEACHHUNTING_Heart ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Heart))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Heart_07_00"); //Srdce magickejch tvorù jsou setsakramentsky vzácný a získáš je fakt têžko. Když to zkoušíš, buë poâádnê vopatrnej, zvlášã když jde vo golemy.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Talbin_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP3_EXIT_Condition;
	information	= DIA_Talbin_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Talbin_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP4_EXIT_Condition;
	information	= DIA_Talbin_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Kap4_Wasneues
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_KAP4_WASNEUES		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 13;
	condition	 = 	DIA_Talbin_KAP4_WASNEUES_Condition;
	information	 = 	DIA_Talbin_KAP4_WASNEUES_Info;

	description  =  "Nevšiml sis, že by tudy nêkdo prošel?";
};

func int DIA_Talbin_KAP4_WASNEUES_Condition ()
{
	if 	(Kapitel >= 4)
		&& (Talbin_FollowsThroughPass == 0)
		&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_KAP4_WASNEUES_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_KAP4_WASNEUES_15_00"); //Nevšiml sis, že by tudy nêkdo prošel?
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASNEUES_07_01"); //Jo, nedávno tudy probêhlo pár takovejch divnejch chlápkù. Vykraèovali si v tom svým naleštêným brnêní jak pávi a chovali se, jako dyž sežrali všecku moudrost svêta.
};

///////////////////////////////////////////////////////////////////////
//	Info WaswolltenDJG
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_KAP4_WASWOLLTENDJG		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 14;
	condition	 = 	DIA_Talbin_KAP4_WASWOLLTENDJG_Condition;
	information	 = 	DIA_Talbin_KAP4_WASWOLLTENDJG_Info;

	description	 = 	"A co tady ti 'divní chlápkové' chtêli?";
};

func int DIA_Talbin_KAP4_WASWOLLTENDJG_Condition ()
{
if 	(Npc_KnowsInfo(other, DIA_Talbin_KAP4_WASNEUES))
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASWOLLTENDJG_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_KAP4_WASWOLLTENDJG_15_00"); //A co tady ti 'divní chlápkové' chtêli?
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASWOLLTENDJG_07_01"); //Chtêli po mnê proviant a vybavení. Chlape, dyk já mám sotva dost pro sebe!
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASWOLLTENDJG_07_02"); //Prý zabíjejí draky a tak. Bùhví vodkuë ti hošani pâišli, ale nevypadali moc dùvêryhodnê!

	if (Kapitel == 4)
	{
		B_LogEntry (TOPIC_Dragonhunter,"U sídla lovce Talbina se zastavilo nêkolik drakobijcù."); 
	};
};



///////////////////////////////////////////////////////////////////////
//	Info woEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WOENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_WOENGROM_Condition;
	information	 = 	DIA_Talbin_WOENGROM_Info;

	description	 = 	"Ty jsi tu teë sám?";
};

func int DIA_Talbin_WOENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (EngromIsGone == TRUE)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WOENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WOENGROM_15_00"); //Ty jsi tady teë sám?
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_01"); //Jo. Mùj kámoš Engrom už toho mêl dost a zdrhnul. Vèera tvrdil, že mêl àákou vizi, že na nêj prej nêkdo dêsnê jemnê mluvil.
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_02"); //Já ale neslyšel ani ãuk. Prostê jsem si myslel, že už se totálnê zcvoknul a...
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_03"); //...a pak byl najednou pryè. Nemám tušáka, kam se ztratil.
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_04"); //Kdybys Engrema náhodou nêkde zahlíd, tak mu vyâië, že mi ten hajzl eštê furt dluží kùži z èíhavce.

	if (Npc_KnowsInfo(other, DIA_Engrom_WhatAboutLeaving))
		{
	AI_Output			(other, self, "DIA_Talbin_WOENGROM_15_05"); //Mêl jsem ale dojem, že se vocuë nechce hnout, dokud nebudou pryè všichni skâeti.
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_06"); //Jak sem âek - je v tom nêco divnýho.
		};
	MIS_Tabin_LookForEngrom = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info FoundEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_FOUNDENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	16;
	condition	 = 	DIA_Talbin_FOUNDENGROM_Condition;
	information	 = 	DIA_Talbin_FOUNDENGROM_Info;

	description	 = 	"Našel jsem tvého kámoše Engroma.";
};

func int DIA_Talbin_FOUNDENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WOENGROM))
	&& ((NpcObsessedByDMT_Engrom == TRUE)||(Npc_HasItems (other,ItAt_TalbinsLurkerSkin)) ) 
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_FOUNDENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_00"); //Našel jsem tvého kámoše Engroma.
	AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_01"); //Fakt? A kde je?


	if (Npc_IsDead(Engrom))
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_02"); //Je mrtvý.
	}
	else	
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_03"); //Ani sem nedoufal, že ho eštê nêkdy uvidím.
	};

	if (B_GiveInvItems (other, self, ItAt_TalbinsLurkerSkin,1))
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_04"); //Tumáš - mêl u sebe tuhle èíhavèí kùži.
	};	

	if (hero.guild ==GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_05"); //Posedli ho Pátraèi.
		AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_06"); //Pátraèi? A kdo to má jako bejt?
		AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_07"); //Služebníci z dolních zemí. To oni ve skuteènosti velí všem têm skâetùm.
	};	

	AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_08"); //Pâi Innosovi! Musím se vocuë dostat, i kdyby mê to mêlo stát krk! Teë nebo nikdy!
	AI_StopProcessInfos (self);	

	Log_CreateTopic (TOPIC_Talbin_Runs, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Talbin_Runs, LOG_RUNNING);
	B_LogEntry (TOPIC_Talbin_Runs,"Talbin, lovec z Hornického údolí, probêhl pâes prùsmyk, i když mêl v patách celé roje krvavých much. Myslím, že míâí do Khorinidu."); 

	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"FleePass");
	Wld_InsertNpc	(Snapper, "START");
	Talbin_Runs = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WOHIN		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	17;
	condition	 = 	DIA_Talbin_WOHIN_Condition;
	information	 = 	DIA_Talbin_WOHIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Kam se vydáš?";
};

func int DIA_Talbin_WOHIN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_FOUNDENGROM))
	&& (Talbin_FollowsThroughPass == 0)
		
		{
				return TRUE;
		};
};

func void DIA_Talbin_WOHIN_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_15_00"); //Kam se vydáš?

		if (Npc_GetDistToWP(self,"START")<1000) 
		{
			AI_Output			(self, other, "DIA_Talbin_WOHIN_07_01"); //Proveë mê prùsmykem! Prosím!!!
		
			Info_ClearChoices	(DIA_Talbin_WOHIN);
			Info_AddChoice	(DIA_Talbin_WOHIN, "Nemám na tebe èas.", DIA_Talbin_WOHIN_ );
			Info_AddChoice	(DIA_Talbin_WOHIN, "Bêž dál a projdi prùsmykem.", DIA_Talbin_WOHIN_durch );
			Info_AddChoice	(DIA_Talbin_WOHIN, "Dobrá.", DIA_Talbin_WOHIN_ok );
		}
		else
		{
		AI_Output			(self, other, "DIA_Talbin_WOHIN_07_02"); //Musím se vocuë dostat, pâes prùsmyk. Jdi mi z cesty!
		AI_StopProcessInfos (self);
		};


};
func void DIA_Talbin_WOHIN_ok ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_ok_15_00"); //Dobrá.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_ok_07_01"); //Díky ti - prostê bêž napâed a já pudu za tebou.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"IntoPass");
	Talbin_FollowsThroughPass = LOG_RUNNING;
	self.flags = NPC_FLAG_IMMORTAL;	//Joly: eh nur so lange, bis der SC durch den Levelchange geht!

};

func void DIA_Talbin_WOHIN_durch ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_durch_15_00"); //Bêž dál a projdi prùsmykem.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_durch_07_01"); //Je tam taková tma - nikdy bych se tam sám nevodvážil.

};

func void DIA_Talbin_WOHIN_ ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_schwein_15_00"); //Nemám na tebe èas.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_schwein_07_01"); //Takže ty mê tu necháš, aby mê sežraly vrány. Za tohle se budeš smažit v pekle!
	Talbin_FollowsThroughPass = LOG_OBSOLETE;
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_VERSCHWINDE		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_VERSCHWINDE_Condition;
	information	 = 	DIA_Talbin_VERSCHWINDE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Hej.";
};

func int DIA_Talbin_VERSCHWINDE_Condition ()
{
	if (Talbin_FollowsThroughPass == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_VERSCHWINDE_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_VERSCHWINDE_15_00"); //Hej.
	AI_Output			(self, other, "DIA_Talbin_VERSCHWINDE_07_01"); //Zmizni. Zvládnu to i bez tebe, ty parchante!
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Talbin_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP5_EXIT_Condition;
	information	= DIA_Talbin_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Talbin_KAP6_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP6_EXIT_Condition;
	information	= DIA_Talbin_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Talbin_PICKPOCKET (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 900;
	condition	= DIA_Talbin_PICKPOCKET_Condition;
	information	= DIA_Talbin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Talbin_PICKPOCKET_Condition()
{
	C_Beklauen (40, 25);
};
 
FUNC VOID DIA_Talbin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Talbin_PICKPOCKET);
	Info_AddChoice		(DIA_Talbin_PICKPOCKET, DIALOG_BACK 		,DIA_Talbin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Talbin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Talbin_PICKPOCKET_DoIt);
};

func void DIA_Talbin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Talbin_PICKPOCKET);
};
	
func void DIA_Talbin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Talbin_PICKPOCKET);
};


