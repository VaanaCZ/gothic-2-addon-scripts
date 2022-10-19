///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bengar_EXIT   (C_INFO)
{
	npc         = BAU_960_Bengar;
	nr          = 999;
	condition   = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bengar_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_HALLO		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	3;
	condition	 = 	DIA_Bengar_HALLO_Condition;
	information	 = 	DIA_Bengar_HALLO_Info;

	description	 = 	"Ty jsi tady farm·‚em?";
};

func int DIA_Bengar_HALLO_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_HALLO_15_00"); //Ty jsi tady farm·‚em?
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_01"); //Dalo by se to tak ‚Ìct, ale jsem jen n·jemce.
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_02"); //VeökerÈ pozemky pat‚Ì velkostatk·‚i.

};

///////////////////////////////////////////////////////////////////////
//	Info wovonlebtihr
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_WOVONLEBTIHR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Bengar_WOVONLEBTIHR_Condition;
	information	 = 	DIA_Bengar_WOVONLEBTIHR_Info;

	description	 = 	"Jak si obstar·v·ö obûivu?";
};

func int DIA_Bengar_WOVONLEBTIHR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_WOVONLEBTIHR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_WOVONLEBTIHR_15_00"); //Jak si obstar·v·ö obûivu?
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_01"); //VÍtöinou lovem a k·cenÌm strom˘. Taky samoz‚ejmÍ chov·me ovce a obdÍl·v·me p˘du.
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_02"); //Onar mi sem poslal vöechny tyhle lidi a j· je musÌm ûivit. A jen m·lo z nich umÌ vzÌt za pr·ci, jak sis asi s·m vöiml.

};


///////////////////////////////////////////////////////////////////////
//	Info tageloehner
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_TAGELOEHNER		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	6;
	condition	 = 	DIA_Bengar_TAGELOEHNER_Condition;
	information	 = 	DIA_Bengar_TAGELOEHNER_Info;

	description	 = 	"ZamÍstn·v·ö n·denÌky?";
};

func int DIA_Bengar_TAGELOEHNER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_TAGELOEHNER_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_TAGELOEHNER_15_00"); //ZamÍstn·v·ö n·denÌky?
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_01"); //Onar vyhodil lidi, co mu na jeho farmÍ nebyli k niËemu.
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_02"); //Pak je poslal ke mnÍ. D·v·m jim najÌst a oni pro mÍ pracujÌ.

};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_MissingPeople		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bengar_MissingPeople_Info;

	description	 = 	"Neud·lo se tu poslednÌ dobou nÍco divnÈho?";
};

func int DIA_Addon_Bengar_MissingPeople_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_MissingPeople_15_00"); //NesebÍhlo se tu v poslednÌ dobÍ nÍco divnÈho?
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_01"); //PoslednÌ dobou se tu dÍjÌ divnÈ vÍci.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_02"); //Ale nic nenÌ divnÍjöÌho neû to z·hadnÈ zmizenÌ Parda.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_03"); //B˝val jednÌm z dÍlnÌk˘ na poli a rozhodnÍ nepat‚il k tÍm, co by najednou se vöÌm praötili, sebrali se a takhle utekli.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Sedl·k Bengar postr·d· svÈho ËeledÌna Pardose."); 

	MIS_Bengar_BringMissPeopleBack = LOG_RUNNING;
	B_GivePlayerXP (XP_Ambient);

	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, DIALOG_BACK, DIA_Addon_Bengar_MissingPeople_back );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Napad· tÍ, proË zmizel?", DIA_Addon_Bengar_MissingPeople_Hint );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Moûn· uû mÍl prostÍ vöeho dost.", DIA_Addon_Bengar_MissingPeople_voll );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Co je na jeho zmizenÌ tak divnÈho?", DIA_Addon_Bengar_MissingPeople_was );
};
func void DIA_Addon_Bengar_MissingPeople_was ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_00"); //Co p‚esnÍ je na tom jeho zmizenÌ divnÈho?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_01"); //Pardos je trochu b·zliv˝ - jakûiv nebyl d·l neû na kraji m˝ch polÌ.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_02"); //Zdrhnul by, i kdyby nÍkde zahlÌdnul ûravou ötÍnici.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_03"); //Na tu sice nenÌ pÍkn˝ pohled, ale rozhodnÍ se ned· ‚Ìct, ûe by ölo o nebezpeËnou potvoru.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_04"); //(znechucenÍ) A to se pr˝ najdou lidi, kte‚Ì je jedÌ. Fuj tajbl.
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_05"); //Na to si zvykneö.
};
func void DIA_Addon_Bengar_MissingPeople_voll ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_voll_15_00"); //Moûn· uû toho mÍl prostÍ plnÈ zuby.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_01"); //On pracÌ na polÌch ûil. Nedok·ûu si p‚edstavit, ûe by utekl makat na jin˝ statek.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_02"); //U mÍ si mohl dÍlat, co chtÍl.
	
};
func void DIA_Addon_Bengar_MissingPeople_Hint ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Hint_15_00"); //M·ö nÍjakÈ stopy?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_01"); //MyslÌm, ûe ho museli odvlÈct ti banditi. Uû p·r dnÌ se tu potulovali kolem.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_02"); //Jednou jsem vidÍl, jak do svÈho t·bora t·hli nÍkoho z mÍsta.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_03"); //Vypadalo to, ûe z nÍj chtÍjÌ udÍlat otroka.
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Kde leûÌ t·bor bandit˘?", DIA_Addon_Bengar_MissingPeople_Lager );
};
var int Bengar_ToldAboutRangerBandits;
func void DIA_Addon_Bengar_MissingPeople_Lager ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Lager_15_00"); //Kde leûÌ ten t·bor bandit˘?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_01"); //Na konci m˝ch polnostÌ jsou schody, kterÈ vedou do malÈho ˙dolÌËka. Tam se ti lapkovÈ usadili.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_02"); //Moc r·d bych si tam pro Parda zaöel, ale j· proti tÍm chlap˘m nem·m û·dnou öanci.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_03"); //A ty by ses jim mÍl taky na sto hon˘ vyhnout. NemajÌ zrovna smysl pro humor.
	Bengar_ToldAboutRangerBandits = TRUE;
};
func void DIA_Addon_Bengar_MissingPeople_back ()
{
	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnPardos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_ReturnPardos		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_ReturnPardos_Condition;
	information	 = 	DIA_Addon_Bengar_ReturnPardos_Info;

	description	 = 	"Vr·til se Pardos zp·tky?";
};

func int DIA_Addon_Bengar_ReturnPardos_Condition ()
{
	if 	(MIS_Bengar_BringMissPeopleBack == LOG_RUNNING)
	&&  (Npc_GetDistToWP (Pardos_NW, "NW_FARM3_HOUSE_IN_NAVI_2") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_00"); //Uû se Pardos vr·til?
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_01"); //Ano, uû je doma a odpoËÌv·. DÌky za vöechno, co jsi...
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_02"); //To nestojÌ za ‚eË.
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_03"); //PoËkej, chci se ti odmÍnit, ale nem·m...
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_04"); //Kaöli na to.
	
	B_GivePlayerXP (XP_Ambient);
};	

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_FernandosWeapons		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Bengar_FernandosWeapons_Info;

	description	 = 	"Kdyû tudy ti banditÈ proch·zeli, mÍli u sebe zbranÍ?";
};

func int DIA_Addon_Bengar_FernandosWeapons_Condition ()
{
	if (Bengar_ToldAboutRangerBandits == TRUE)
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)		
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_00"); //Kdyû tudy ti banditÈ proch·zeli, nemÍli u sebe nÍjakÈ zbranÍ?
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_01"); //Co je to za hloupou ot·zku? Copak by tu banditi pobÌhali jen tak beze zbranÌ?
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_02"); //MyslÌm SPOUSTU zbranÌ. Velkou dod·vku.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_03"); //Ch·pu. Jo, kdyû o tom mluvÌö, tak toho v·ûnÍ nesli hromady.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_04"); //NÍco v sudech, nÍco ve vacÌch a nÍco i na vozech, kterÈ s sebou mÍli.
	 B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info rebellieren
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_REBELLIEREN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	8;
	condition	 = 	DIA_Bengar_REBELLIEREN_Condition;
	information	 = 	DIA_Bengar_REBELLIEREN_Info;

	description	 = 	"Co si myslÌö o Onarovi?";
};

func int DIA_Bengar_REBELLIEREN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_REBELLIEREN_15_00"); //Co si myslÌö o Onarovi?
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_01"); //Je to nenaûranej parchant, co n·s nakonec vöechny dostane na öibenici.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_02"); //Jednou sem paladinovÈ z mÍsta dorazÌ a kv˘li tomu bastardovi n·s porubajÌ.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_03"); //Ale j· nem·m na v˝bÍr. Domobrana si sem chodÌ jen proto, aby si odnesla naöe zboûÌ, ale chr·nit n·s ji ani nenapadne.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_04"); //Kdybych z˘stal vÍrn˝ mÍstu, byl bych na to teÎ s·m.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_05"); //Kdyû uû nic jinÈho, Onar poöle p·r sv˝ch ûold·k˘ hned a pak, aby se podÌvali, jak jsme dopadli.
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PALADINE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	9;
	condition	 = 	DIA_Bengar_PALADINE_Condition;
	information	 = 	DIA_Bengar_PALADINE_Info;

	description	 = 	"Co m·ö proti kr·lovsk˝m vojsk˘m?";
};

func int DIA_Bengar_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_REBELLIEREN))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) 
		{
				return TRUE;
		};
};

func void DIA_Bengar_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PALADINE_15_00"); //Co m·ö proti kr·lovsk˝m vojsk˘m?
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_01"); //To je p‚ece jasn˝. Od t˝ doby, co jsou paladinovÈ ve mÍstÍ, se nic nezlepöilo. Pr·vÍ naopak.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_02"); //TeÎ ti zatracenÌ voj·ci z domobrany p‚ich·zejÌ na naöe pozemky st·le ËastÍji a kradou, co se jim zachce. A paladinovÈ proti tomu nehnou ani prstem.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_03"); //JedinÌ paladinovÈ, kterÈ jsem kdy vidÍl, jsou ti dva str·ûci u pr˘smyku.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_04"); //NehodlajÌ hnout ani prstem, dokud n·s domobrana vöechny nepovraûdÌ.

};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PASS		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	10;
	condition	 = 	DIA_Bengar_PASS_Condition;
	information	 = 	DIA_Bengar_PASS_Info;

	description	 = 	"Pr˘smyk?";
};

func int DIA_Bengar_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Bengar_PASS_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PASS_15_00"); //U jakÈho pr˘smyku?
	AI_Output			(self, other, "DIA_Bengar_PASS_10_01"); //U pr˘smyku do starÈho HornickÈho ˙dolÌ u vodop·d˘ na druhÈm konci n·hornÌch pastvin.
	AI_Output			(self, other, "DIA_Bengar_PASS_10_02"); //Zeptej se na to Malaka. Tenhle t˝den m· spoustu Ëasu.

};

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZ (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_MILIZ_Condition;
	information	= DIA_Bengar_MILIZ_Info;
	permanent 	= FALSE;
	description	= "¬eknÍme, ûe se na ten v·ö problÈm s domobranou podÌv·m.";
};

func int DIA_Bengar_MILIZ_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZ_15_00"); //¬eknÍme, ûe se na ten v·ö problÈm s domobranou podÌv·m.
		
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_01"); //Co? ¬ekl jsem Onarovi, ûe by mÍl poslat p·r éOLD¡KŸ.
		AI_Output (other, self, "DIA_Bengar_MILIZ_15_02"); //Je to p‚Ìleûitost, jak se p‚esvÍdËit o sv˝ch kvalit·ch.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_03"); //V˝bornÍ. UmÌö si p‚edstavit, co se mnou domobrana udÍl·, kdyû to zpack·ö?
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_04"); //NemÍl jsem dojem, ûe by sem teÎ chtÍl nÍkdo z nich p‚ijÌt.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_05"); //Uû jsem o tom Onarovi ‚Ìkal p‚ed p·r dny. Za co mu tu rentu teda platÌm?
	};
	
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_06"); //Ti bastardi sem chodÌ jednou do t˝dne a vybÌrajÌ danÍ pro mÍsto.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_07"); //Je fajn, ûes p‚iöel pr·vÍ teÎ. V tuhle dobu obvykle p‚ich·zejÌ.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_08"); //MÍli by tu b˝t kaûdou chvÌli.
};

// ************************************************************
// 			  				Selber vorknˆpfen
// ************************************************************
instance DIA_Bengar_Selber (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_Selber_Condition;
	information	= DIA_Bengar_Selber_Info;
	permanent 	= FALSE;
	description	= "A proË se tedy tÈ domobranÍ nepostavÌö s·m?";
};

func int DIA_Bengar_Selber_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Bengar_MilSuccess == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info ()
{
	AI_Output (other, self, "DIA_Bengar_Selber_15_00"); //Je v·s tu tolik. ProË se domobranÍ prostÍ nepostavÌte sami?
	AI_Output (self, other, "DIA_Bengar_Selber_10_01"); //Je pravda, ûe n·s tu je jak ps˘. Ale nem·me v˝cvik na boj s domobranou.
};		

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZKLATSCHEN		(C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZKLATSCHEN_Condition;
	information	= DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent	= FALSE;
	description	= "Jen a„ si teda domobrana dorazÌ, j· uû to s nimi vy‚ÌdÌm!";
};

func int DIA_Bengar_MILIZKLATSCHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_MILIZ))
	&& (!Npc_IsDead(Rick))
	&& (!Npc_IsDead(Rumbold))
	&& (Rumbold_Bezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZKLATSCHEN_15_00"); //Jen a„ si teda domobrana dorazÌ, j· uû to s nimi vy‚ÌdÌm!
	AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_01"); //Nem˘ûu se doËkat. Uû p‚ich·zejÌ. ¬Ìkal jsem ti to.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_02"); //Jen to nezpackej!
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_03"); //Tak dobr·, hodnÍ ötÍstÌ! Ukaû jim to.
	};

	AI_StopProcessInfos (self);
				
	Npc_ExchangeRoutine	(self,"MilComing"); 
	
	if (Hlp_IsValidNpc (Rick))
	&& (!Npc_IsDead (Rick))
	{
		Npc_ExchangeRoutine	(Rick,"MilComing");
		AI_ContinueRoutine (Rick);
	};
	if (Hlp_IsValidNpc (Rumbold))
	&& (!Npc_IsDead (Rumbold))
	{		
		Npc_ExchangeRoutine	(Rumbold,"MilComing"); 
		AI_ContinueRoutine (Rumbold);
	};
};
	
// ************************************************************
// 			  				Miliz weg 
// ************************************************************
var int Bengar_MilSuccess;

instance DIA_Bengar_MILIZWEG (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZWEG_Condition;
	information	= DIA_Bengar_MILIZWEG_Info;
	permanent	= TRUE;
	description	= "V·ö problÈm s domobranou uû je minulostÌ.";
};

func int DIA_Bengar_MILIZWEG_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bengar_MILIZ))
	&& (Bengar_MilSuccess == FALSE)
	{
		if (Npc_IsDead (Rick) && Npc_IsDead (Rumbold))
		|| (Rumbold_Bezahlt == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZWEG_15_00"); //V·ö problÈm s domobranou uû je minulostÌ.
	if (Rumbold_Bezahlt == TRUE)
	&& (Npc_IsDead (Rumbold) == FALSE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_01"); //Jsi bl·zen? VÌö, co mi ti chlapi udÍlajÌ, aû odsud odejdeö?
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_02"); //Po‚·d tu okounÍjÌ. ¬ekni jim, a„ odt·hnou ⁄PLN !
	}
	else
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_03"); //To nenÌ öpatnÈ. Moûn· n·m teÎ na konci mÍsÌce zbude nÍco i pro obchod. DÌky.

		if (Rumbold_Bezahlt == TRUE)
		{		
			AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_04"); //Dokonce jsi za mÍ chtÍl zaplatit. To je od tebe velmi milÈ.
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN + 50);
		}
		else
		{
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
		};
		
		Bengar_MilSuccess = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info balthasar
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASAR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	13;
	condition	 = 	DIA_Bengar_BALTHASAR_Condition;
	information	 = 	DIA_Bengar_BALTHASAR_Info;

	description	 = 	"OvË·k Balthazar na vaöe pastviny nesmÌ?";
};

func int DIA_Bengar_BALTHASAR_Condition ()
{
	if 	(
		(MIS_Balthasar_BengarsWeide == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASAR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASAR_15_00"); //OvË·k Balthazar na vaöe pastviny nesmÌ?
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_01"); //No, ano. To je takhle: ¬ekl jsem Sekobovi, ûe by mi mÍl platit, kdyû chce svÈ ovce p·st na m˝ch pozemcÌch.
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_02"); //Ale pravda je, ûe jsem to ‚ekl jen proto, aby uû sem nechodil. Nem˘ûu Balthazara vyst·t.
	B_LogEntry (TOPIC_BalthasarsSchafe,"M·m-li p‚esvÍdËit Bengara, aby Balthazara pustil na svÈ pastviny, musÌm mu uËinit laskavost. UrËitÍ se k tomu nÍjak· p‚Ìleûitost naskytne."); 
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info balthasardarfaufweide
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASARDARFAUFWEIDE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	14;
	condition	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;

	description	 = 	"Domobrana je pryË a Balthazar m˘ûe tvoji pastvinu znovu vyuûÌvat.";
};

func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Bengar_BALTHASAR))
		&& (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
		&& (Bengar_MilSuccess == TRUE)
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //Domobrana je pryË a Balthazar m˘ûe tvoji pastvinu znovu vyuûÌvat.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //ProË?
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //(v˝hruûnÍ) Protoûe jsem to ‚ekl.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //Mmh. Dobr·, jak chceö.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //A„ si najde mÌsto pro svoje zvÌ‚ata nÍkde mezi poli.

	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	15;
	condition	 = 	DIA_Bengar_PERMKAP1_Condition;
	information	 = 	DIA_Bengar_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"D·vej na sebe pozor.";
};

func int DIA_Bengar_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_BALTHASARDARFAUFWEIDE))
	&& (Kapitel < 3)
			{
					return TRUE;
			};
};

func void DIA_Bengar_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERMKAP1_15_00"); //D·vej na sebe pozor.
	AI_Output			(self, other, "DIA_Bengar_PERMKAP1_10_01"); //Ty tady.

	AI_StopProcessInfos (self);
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

INSTANCE DIA_Bengar_KAP3_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP3_EXIT_Condition;
	information	= DIA_Bengar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Allein
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_ALLEIN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	30;
	condition	 = 	DIA_Bengar_ALLEIN_Condition;
	information	 = 	DIA_Bengar_ALLEIN_Info;

	description	 = 	"Jak se vede?";
};

func int DIA_Bengar_ALLEIN_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_ALLEIN_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_ALLEIN_15_00"); //Jak to vypad·?

	if ((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3")<3000)== FALSE))
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_01"); //Malak zmizel a vzal s sebou vöechno a kaûdÈho, kdo pro mÍ pracoval. ¬Ìkal, ûe m· namÌ‚eno do hor.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_02"); //Uû to tu nemohl vydrûet.
	MIS_GetMalakBack 		= LOG_RUNNING; 
	}
	else
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_03"); //»asy jsou zlÈ. NevÌm, jak dlouho tu jeötÍ vydrûÌm.
	};
	
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_04"); //Vyt·ËÌ mÍ, jak z pr˘smyku teÎ proudÌ z·plavy p‚Ìöer, aby plundrovaly n·hornÌ pastviny.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_05"); //Kdybych tu tak alespo‡ mÍl nÍjakou pomoc do ûold·k˘.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_06"); //Jeden z nich se chystal, ûe pro mÍ bude pracovat. Asi zmÍnil n·zor. M·m dojem, ûe se jmenoval "Vlk".
	MIS_BengarsHelpingSLD 	= LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_BengarALLEIN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN, LOG_RUNNING);
	B_LogEntry (TOPIC_BengarALLEIN,"Bengar z˘stal na svÈm statku docela s·m. Jeho p‚Ìtel Malak zmizel a vöichni ostatnÌ odeöli s nÌm. Podle Bengara se nejspÌö uch˝lili do hor."); 
	B_LogEntry (TOPIC_BengarALLEIN,"Jeho statek je teÎ ˙plnÍ nechr·nÍn˝ a pot‚ebuje pomoc. Zmi‡oval se o nÍjakÈm ûoldnÈ‚i jmÈnem Vlk. Copak j· toho chl·pka nezn·m?"); 
};

///////////////////////////////////////////////////////////////////////
//	Info Malaktot
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKTOT		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_MALAKTOT_Condition;
	information	 = 	DIA_Bengar_MALAKTOT_Info;

	description	 = 	"Malak je mrtv˝.";
};

func int DIA_Bengar_MALAKTOT_Condition ()
{
	if (Npc_IsDead(Malak))
	&& (Malak_isAlive_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKTOT_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKTOT_15_00"); //Malak je mrtv˝.
	AI_Output			(self, other, "DIA_Bengar_MALAKTOT_10_01"); //TeÎ se vöechno obracÌ k horöÌmu.
};

///////////////////////////////////////////////////////////////////////
//	Info SLDda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_SLDDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_SLDDA_Condition;
	information	 = 	DIA_Bengar_SLDDA_Info;

	description	 = 	"Najal jsem ty ûold·ky, kterÈ jsi chtÍl.";
};

func int DIA_Bengar_SLDDA_Condition ()
{
	if (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_SLDDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_SLDDA_15_00"); //Najal jsem ty ûold·ky, kterÈ jsi chtÍl.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_01"); //Nikdy jsem na svÈ farmÍ nikoho podobnÈho nemÍl. Jen douf·m, ûe to bude fungovat.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_02"); //Tady, vezmi si tohle. M·m dojem, ûe se ti to bude hodit.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);
	B_GivePlayerXP (XP_BengarsHelpingSLDArrived);
					
};

///////////////////////////////////////////////////////////////////////
//	Info Malakwiederda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKWIEDERDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	35;
	condition	 = 	DIA_Bengar_MALAKWIEDERDA_Condition;
	information	 = 	DIA_Bengar_MALAKWIEDERDA_Info;

	description	 = 	"Malak se vr·til.";
};

func int DIA_Bengar_MALAKWIEDERDA_Condition ()
{
	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((MIS_GetMalakBack == LOG_SUCCESS)||(NpcObsessedByDMT_Malak == TRUE))
	&& ((Npc_IsDead(Malak))==FALSE)

		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKWIEDERDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKWIEDERDA_15_00"); //Malak se vr·til.
	AI_Output			(self, other, "DIA_Bengar_MALAKWIEDERDA_10_01"); //Uû bylo naËase. Myslel jsem, ûe uû ho vÌckr·t neuvidÌm.
	B_GivePlayerXP (XP_GetMalakBack);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERM		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	80;
	condition	 = 	DIA_Bengar_PERM_Condition;
	information	 = 	DIA_Bengar_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"To bude v po‚·dku.";
};

func int DIA_Bengar_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_ALLEIN))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERM_15_00"); //To bude v po‚·dku.

	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((Npc_IsDead(Malak))==FALSE)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_01"); //Malak se sice vr·til, ale na situaci to moc nemÍnÌ.
		AI_Output			(self, other, "DIA_Bengar_PERM_10_02"); //Pokud se nestane nÍjak˝ z·zrak, vöichni to tu odsk·Ëeme.
	}
	else if (Npc_KnowsInfo(other, DIA_Bengar_SLDDA))
		&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		&& (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_03"); //Vlk je divnej chlap, ale myslÌm, ûe to nÍjak zvl·dneme.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_04"); //Bez Malaka tu nic nefunguje. Jestli se brzy nÍco nestane, vzd·m se farmy.

		if (Malak_isAlive_Kap3 == TRUE)
		&& ((Npc_IsDead(Malak))== FALSE)
		{
			AI_Output			(self, other, "DIA_Bengar_PERM_10_05"); //Snad se brzy vr·tÌ.
		};
	};
	AI_StopProcessInfos (self);
	
	if (Npc_IsDead(SLD_Wolf))
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	B_StartOtherRoutine	(SLD_815_Soeldner,"ZaËÌt");
	B_StartOtherRoutine	(SLD_817_Soeldner,"ZaËÌt");
	};
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

INSTANCE DIA_Bengar_KAP4_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP4_EXIT_Condition;
	information	= DIA_Bengar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Bengar_KAP5_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP5_EXIT_Condition;
	information	= DIA_Bengar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP5_EXIT_Info()
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


INSTANCE DIA_Bengar_KAP6_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP6_EXIT_Condition;
	information	= DIA_Bengar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bengar_PICKPOCKET (C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 900;
	condition	= DIA_Bengar_PICKPOCKET_Condition;
	information	= DIA_Bengar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bengar_PICKPOCKET_Condition()
{
	C_Beklauen (28, 50);
};
 
FUNC VOID DIA_Bengar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bengar_PICKPOCKET);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_BACK 		,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};
	
func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};


















































































