///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Farim_EXIT   (C_INFO)
{
	npc         = VLK_4301_Addon_Farim;
	nr          = 999;
	condition   = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Farim_PICKPOCKET (C_INFO)
{
	npc			= VLK_4301_Addon_Farim;
	nr			= 900;
	condition	= DIA_Addon_Farim_PICKPOCKET_Condition;
	information	= DIA_Addon_Farim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Farim_PICKPOCKET_Condition()
{
	C_Beklauen (20, 11);
};
 
FUNC VOID DIA_Addon_Farim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
	
func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Hallo		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Hallo_Condition;
	information	 = 	DIA_Addon_Farim_Hallo_Info;

	description	 = 	"Jesteœ rybakiem?";
};

func int DIA_Addon_Farim_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Hallo_15_00"); //Jesteœ rybakiem?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_01"); //Jak na to wpad³eœ?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_02"); //Mo¿e po prostu zostawisz mnie w spokoju, co?
	if (hero.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //Nie mam nic do ciebie, ale ostatnio mia³em sporo nieprzyjemnych staræ ze stra¿¹, wiêc rozumiesz...
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //Nie oceniaj mnie zbyt pochopnie. Po prostu jestem w pod³ym nastroju. K³opoty ze stra¿¹, rozumiesz...
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MilizProbs
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MilizProbs		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MilizProbs_Condition;
	information	 = 	DIA_Addon_Farim_MilizProbs_Info;

	description	 = 	"K³opoty ze stra¿¹?";
};

func int DIA_Addon_Farim_MilizProbs_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MilizProbs_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //K³opoty ze stra¿¹?
	if (((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //Ci dranie regularnie mnie nachodz¹ i zabieraj¹, co im siê ¿ywnie podoba!
	};
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //W ostatnim tygodniu zabrali mi ca³y po³ów. Powiedzieli, ¿e to "dla wspólnego dobra"!
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //Wiem, ¿e jesteœmy zdani na w³asne si³y od czasu, gdy farmerzy przestali handlowaæ.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //Niektórzy jedz¹ porz¹dny posi³ek raz na tydzieñ. Nic dziwnego, ¿e stra¿ zabra³a mi wszystkie ryby.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //Ale jeœli tak dalej pójdzie, to wkrótce sam zacznê g³odowaæ.
	
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Daj mi swoje ryby.", DIA_Addon_Farim_MilizProbs_klauen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Mo¿e bêdê móg³ ci jakoœ pomóc.", DIA_Addon_Farim_MilizProbs_helfen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Rozmawia³eœ o tym z paladynami?", DIA_Addon_Farim_MilizProbs_paladine );
};
func void DIA_Addon_Farim_MilizProbs_paladine ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //Rozmawia³eœ o tym z paladynami?
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //¯artujesz chyba! A co ich obchodzi, ¿e taki chudopacho³ek, jak ja, ma problemy ze stra¿¹?
};
var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //Daj mi swoje ryby.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //Wiedzia³em. Kolejny z tych siepaczy.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //Obawiam siê, ¿e przyszed³eœ trochê za póŸno. Twoi kompani zabrali wszystko ju¿ wczoraj.
	};
	
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //Myœlê, ¿e ju¿ czas na ciebie.
	Farim_PissedOff = TRUE;
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
};
func void DIA_Addon_Farim_MilizProbs_helfen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //Mo¿e bêdê móg³ ci jakoœ pomóc.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //Bo ja wiem... Musia³byœ znaæ kogoœ w stra¿y, kto ma dojœcie do paladynów...
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //Sami paladyni raczej nie KUPI¥ ode mnie ryb.
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //Zobaczê, co da siê zrobiæ.
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	
	Log_CreateTopic (TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_FarimsFish,"Rybak Farim ma k³opoty ze stra¿¹, która zabiera mu zbyt wiele ryb, by móg³ zarobiæ na ¿ycie. Muszê znaleŸæ w stra¿y kogoœ, kto ma wp³yw na paladynów, i pomóc Farimowi."); 
		
	MIS_Addon_Farim_PaladinFisch = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MartinHelps
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MartinHelps		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MartinHelps_Condition;
	information	 = 	DIA_Addon_Farim_MartinHelps_Info;

	description	 = 	"Wiem ju¿, jak rozwi¹zaæ twoje problemy.";
};

func int DIA_Addon_Farim_MartinHelps_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Martin_KnowsFarim == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MartinHelps_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //Wiem ju¿, jak rozwi¹zaæ twoje problemy.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //Zamieniam siê w s³uch.

	if (hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)
	{
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //Jestem tu od niedawna i ma³o mogê.
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //Ale znam kogoœ, kto móg³by ci pomóc.
	};
	
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //Martin, kwatermistrz paladynów, powiedzia³, ¿e chêtnie wys³ucha twojej skargi.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //Myœlisz, ¿e powie stra¿nikom, by zostawili mnie w spokoju?
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //Tak powiedzia³.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //Dobrze. Wielkie dziêki. Niestety, nie mogê ci siê odwdziêczyæ. Chocia¿...
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //Ten dziwny b³êkitny kamieñ znalaz³em kiedyœ na wyspie w pobli¿u Khorinis.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //Nie s¹dzê, by by³ wiele wart, ale ktoœ taki jak ty na pewno znajdzie dla niego zastosowanie.
		
	B_GiveInvItems (self, other, ItMi_Aquamarine, 1);		
	
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Farim_PaladinFisch);
};

///////////////////////////////////////////////////////////////////////
//	Info Landstreicher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Landstreicher		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Landstreicher_Condition;
	information	 = 	DIA_Addon_Farim_Landstreicher_Info;

	description	 = 	"Mo¿esz mi coœ powiedzieæ o zaginionych ludziach?";
};

func int DIA_Addon_Farim_Landstreicher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info ()
{
	AI_Output (other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //Mo¿esz mi coœ powiedzieæ o zaginionych ludziach?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //Mój kumpel, William, zadawa³ siê ostatnio z podejrzanymi typkami i do czego to doprowadzi³o?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //Pewnego dnia nie przyszed³ do pracy i od tego czasu nikt go ju¿ nie widzia³.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_William		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_William_Condition;
	information	 = 	DIA_Addon_Farim_William_Info;

	description	 = 	"William te¿ zagin¹³?";
};

func int DIA_Addon_Farim_William_Condition ()
{
	if (SCKnowsFarimAsWilliamsFriend == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_William_15_00"); //William te¿ zagin¹³?
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_01"); //Zgadza siê. By³ zwyk³ym rybakiem, choæ nie da siê ukryæ, ¿e czasami zdrowo mu odbija³o.
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_02"); //Nie powinien by³ siê brataæ z tymi obwiesiami.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 
	
	Info_ClearChoices	(DIA_Addon_Farim_William);	
	Info_AddChoice	(DIA_Addon_Farim_William, "Co masz na myœli?", DIA_Addon_Farim_William_typen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Jestem pewien, ¿e prêdzej czy póŸniej wróci do domu.", DIA_Addon_Farim_William_auftauchen );
	Info_AddChoice	(DIA_Addon_Farim_William, "A co takiego robi³?", DIA_Addon_Farim_William_WasGemacht );
	Info_AddChoice	(DIA_Addon_Farim_William, "Kiedy widzia³eœ go po raz ostatni?", DIA_Addon_Farim_William_WannWeg );
};
func void DIA_Addon_Farim_William_WasGemacht ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //A co takiego robi³?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //William chyba krêci³ jakieœ lewe interesy z tymi rzezimieszkami.
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //S¹dzê, ¿e sprzedawa³ im jakieœ nielegalne towary.
	//AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); //Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, weiß ich nicht, was er stattdessen für sie gemacht hat.
};
func void DIA_Addon_Farim_William_typen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_typen_15_00"); //Co masz na myœli?
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_01"); //Nie wiem, kim s¹, ani czego szukaj¹ w Khorinis.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_02"); //Wiem tylko, gdzie siê spotykali z Williamem.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_03"); //Widzia³em go tam tylko raz i to przypadkiem, podczas ³owienia ryb.
	
	Info_AddChoice	(DIA_Addon_Farim_William, "Gdzie siê spotykali?", DIA_Addon_Farim_William_Wo );
};
func void DIA_Addon_Farim_William_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //Gdzie siê spotykali?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //Po przeciwnej stronie przystani, na pó³nocy, le¿y ma³a zatoka.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //Mo¿na siê tam dostaæ wp³aw lub ³ódk¹.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //W zatoce znajduje siê pla¿a, na której widzia³em tych przemytników.
	self.flags = 0;	//Joly: hat seine Pflicht getan

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kolega rybaka Farima, William, zagin¹³. Podobno William spotyka³ siê z jakimiœ rzezimieszkami w zatoce na pó³noc od portu."); 

	Info_AddChoice	(DIA_Addon_Farim_William, "Chyba us³ysza³em ju¿ wystarczaj¹co wiele.", DIA_Addon_Farim_William_Tschau );
};
func void DIA_Addon_Farim_William_WannWeg ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //Kiedy widzia³eœ go po raz ostatni?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //Nie dalej jak kilka dni temu.

	Info_AddChoice	(DIA_Addon_Farim_William, "Mo¿e po prostu wyp³yn¹³ na po³ów?", DIA_Addon_Farim_William_Fischen );
};
func void DIA_Addon_Farim_William_Fischen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //Mo¿e po prostu wyp³yn¹³ na po³ów?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //Niemo¿liwe. Jego ³ódŸ jest wci¹¿ zacumowana na przystani.
};
func void DIA_Addon_Farim_William_auftauchen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //Jestem pewien, ¿e prêdzej czy póŸniej wróci do domu.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //Nie s¹dzê. Zbyt d³ugo ju¿ go nie ma.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //Bojê siê, ¿e któregoœ dnia morze wyrzuci na brzeg jego cia³o.
};
func void DIA_Addon_Farim_William_Tschau ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //Chyba us³ysza³em ju¿ wystarczaj¹co wiele.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //Nie przejmuj siê tym. W¹tpiê, byœ go znalaz³.
	Info_ClearChoices	(DIA_Addon_Farim_William);	
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Perm		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Farim_Perm_Condition;
	information	 = 	DIA_Addon_Farim_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"I jak tam ryby? Bior¹?";
};

func int DIA_Addon_Farim_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Perm_15_00"); //I jak tam ryby? Bior¹?

	if (Farim_PissedOff == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_01"); //Ech, nie udawaj, ¿e ciê to interesuje!
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_02"); //Bywa³o lepiej. Jest jak jest. Za ma³o by ¿yæ, za du¿o, by umrzeæ.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_WilliamReport (C_INFO)
{
	npc		 	= VLK_4301_Addon_Farim;
	nr		 	= 1;
	condition	= DIA_Addon_Farim_WilliamReport_Condition;
	information	= DIA_Addon_Farim_WilliamReport_Info;

	important 	= TRUE;
};

func int DIA_Addon_Farim_WilliamReport_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_William))
	{
		if (Npc_HasItems (other, ITWr_Addon_William_01) > 0)
		|| (Saturas_AboutWilliam == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info ()
{
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_01"); //Wróci³eœ!
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_02"); //S³ysza³eœ coœ o Williamie?
	AI_Output (other, self, "DIA_Addon_Farim_Add_15_02"); //Nie ¿yje.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_03"); //Spodziewa³em siê takich wieœci.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_04"); //Dziêki, ¿e wróci³eœ, by mi to powiedzieæ.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_05"); //Pójdê do knajpy i za czêœæ zdobyczy Williama wypijê za jego pamiêæ. Wiem, ¿e on post¹pi³by tak samo, gdybym to ja zgin¹³.
};






