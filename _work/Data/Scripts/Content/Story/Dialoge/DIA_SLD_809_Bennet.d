// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bennet_EXIT   (C_INFO)
{
	npc         = SLD_809_Bennet;
	nr          = 999;
	condition   = DIA_Bennet_EXIT_Condition;
	information = DIA_Bennet_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bennet_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bennet_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo 
// ************************************************************
instance DIA_Bennet_HALLO	(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 1;
	condition	= DIA_Bennet_HALLO_Condition;
	information	= DIA_Bennet_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Bennet_HALLO_Condition ()
{
	if (Kapitel < 3)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bennet_HALLO_06_00"); //Neprod·v·m û·dnÈ zbranÏ. Khaled je prod·v·. Je v domÏ s Onarem.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Khaled prod·v· zbranÏ.");
};

// ************************************************************
// 			  				TRADE 
// ************************************************************
instance DIA_Bennet_TRADE		(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 700;
	condition	= DIA_Bennet_TRADE_Condition;
	information	= DIA_Bennet_TRADE_Info;
	permanent	= TRUE;
	description	= "M˘ûeö mi prodat nÏjakÈ vÏci na kov·nÌ?";
	trade		= TRUE;
};

func int DIA_Bennet_TRADE_Condition ()
{
	if ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TRADE_15_00"); //M˘ûeö mi prodat nÏjakÈ vÏci na kov·nÌ?
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

	AI_Output (self, other, "DIA_Bennet_TRADE_06_01"); //Co pot¯ebujeö?
	
	if (BennetLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Bennet prod·v· kov·¯skÈ n·ËinÌ.");
		BennetLOG = TRUE;
	};
};

// ************************************************************
// 			  				WhichWeapons 
// ************************************************************
instance DIA_Bennet_WhichWeapons (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 2;
	condition	= DIA_Bennet_WhichWeapons_Condition;
	information	= DIA_Bennet_WhichWeapons_Info;
	permanent	= FALSE;
	description	= "JakÈ zbranÏ vyr·bÌö?";
};

func int DIA_Bennet_WhichWeapons_Condition ()
{
	if ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	&& (MIS_Bennet_BringOre == FALSE)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhichWeapons_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_00"); //JakÈ zbranÏ vyr·bÌö?
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_01"); //V tuhle chvÌli obyËejnÈ meËe, nic jinÈho.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_02"); //Ale kdybych mÏl trochu magickÈ rudy, mohl bych ukovat zbranÏ, kterÈ jsou mnohem lepöÌ neû vöechny srovnatelnÈ zbranÏ vyrobenÈ z norm·lnÌ starÈ oceli.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_03"); //NevÌö n·hodou, kde bych tady v okolÌ nÏjakou naöel? (smÏje se) M·m na mysli kromÏ HornickÈho ˙dolÌ samoz¯ejmÏ.
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_04"); //Ne.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_05"); //Samoz¯ejmÏ ne.
};

// ************************************************************
// 			  				BauOrSld 
// ************************************************************
instance DIA_Bennet_BauOrSld (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 3;
	condition	= DIA_Bennet_BauOrSld_Condition;
	information	= DIA_Bennet_BauOrSld_Info;
	permanent	= FALSE;
	description	= "Pat¯Ìö k rolnÌk˘m, nebo k ûold·k˘m?";
};

func int DIA_Bennet_BauOrSld_Condition ()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_00"); //Pat¯Ìö k rolnÌk˘m, nebo k ûold·k˘m?
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_01"); //Ty si ze mÏ utahujeö, ûe jo?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_02"); //Byl jsem jenom zvÏdav˝.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_03"); //Uû jsi nÏkdy vidÏl farm·¯e kovat zbranÏ?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_04"); //Ne.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_05"); //Tak proË mi d·v·ö tak hloupÈ ot·zky?
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************
instance DIA_Bennet_WannaJoin (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 4;
	condition	= DIA_Bennet_WannaJoin_Condition;
	information	= DIA_Bennet_WannaJoin_Info;
	permanent	= TRUE;
	description	= "Chci se p¯idat k ûoldnÈ¯˘m!";
};

func int DIA_Bennet_WannaJoin_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bennet_BauOrSld))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaJoin_15_00"); //Chci se p¯idat k ûoldnÈ¯˘m!
	AI_Output (self, other, "DIA_Bennet_WannaJoin_06_01"); //P¯estaÚ ûvanit, bÏû za Torlofem a nech ho, aù ti d· test.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Bennet_WannaJoin_15_02"); //Proöel jsem zkouökou.
		AI_Output (self, other, "DIA_Bennet_WannaJoin_06_03"); //Dob¯e, tak to pro tebe budu hlasovat.
	};
};

// ************************************************************
// 			  				WannaSmith 
// ************************************************************

instance DIA_Bennet_WannaSmith (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 5;
	condition	= DIA_Bennet_WannaSmith_Condition;
	information	= DIA_Bennet_WannaSmith_Info;
	permanent	= TRUE;
	description	= "M˘ûeö mÏ nauËit, jak ukovat meË?";
};

func int DIA_Bennet_WannaSmith_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_15_00"); //M˘ûeö mÏ nauËit, jak ukovat meË?
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_01"); //JasnÏ.
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_02"); //To tÏ bude nÏco st·t. ÿeknÏme 30 zlat˝ch.
	
	Info_ClearChoices (DIA_Bennet_WannaSmith);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Moûn· pozdÏji.", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Dob¯e. Tady m·ö 30 zlatek.", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //Dob¯e. Tady m·ö 30 zlatek.
	
	if (B_GiveInvItems (other, self, itmi_gold, 30))
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //A to byla taky zatracenÏ dobr· cena! M˘ûeme zaËÌt, jakmile budeö p¯ipraven.
		
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Bennet mÏ nauËÌ kov·¯skÈmu umÏnÌ.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //P¯estaÚ se chovat jako naivka. ÿÌk·m 30 a ani o minci mÌÚ.
	};
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //Moûn· pozdÏji.
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};


// ************************************************************
// 			  				Teach COMMON 
// ************************************************************
instance DIA_Bennet_TeachCOMMON (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 6;
	condition	= DIA_Bennet_TeachCOMMON_Condition;
	information	= DIA_Bennet_TeachCOMMON_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString("NauËit se kov·¯stvÌ", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int DIA_Bennet_TeachCOMMON_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TeachCOMMON_15_00"); //NauË mne ukovat meË!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_01"); //Je to celkem jednoduchÈ: Vezmi kus surovÈho ûeleza a drû ho v ohni, dokud se nerozûhavÌ.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_02"); //Pak ho poloû na kovadlinu a roztepej Ëepel do pot¯ebnÈho tvaru.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_03"); //HlavnÏ musÌö d·vat pozor, aby Ëepel p¯Ìliö nevychladla. Na opracov·nÌ zbranÏ m·ö vûdycky jenom p·r minut Ëasu.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_04"); //Na zbytek p¯ijdeö s·m - je to jenom ot·zka praxe.
	};
};

// ************************************************************
// 			  				WannaSmithORE
// ************************************************************
instance DIA_Bennet_WannaSmithORE (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 7;
	condition	= DIA_Bennet_WannaSmithORE_Condition;
	information	= DIA_Bennet_WannaSmithORE_Info;
	permanent	= TRUE;
	description	= "NauË mne, jak ukovat zbranÏ z magickÈ rudy!";
};

func int DIA_Bennet_WannaSmithORE_Condition ()
{
	if (Bennet_TeachSmith == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))	
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_00"); //NauË mne kovat zbranÏ z magickÈ rudy!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_01"); //Ale ty nezn·ö v˘bec ani z·klady.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_02"); //Nejd¯Ìv se musÌö nauËit ukovat obyËejn˝ meË. Pak uvidÌme.
	}
	else if (other.guild != GIL_SLD)
	&& 		(other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_03"); //Protoûe nejsi jednÌm z n·s, tak bych byl v h·ji, kdybych ti vyzradil tajemstvÌ zbranÌ z magickÈ rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_04"); //Pouze velmi m·lo kov·ren tohle vöechno umÌ, a j· vÏ¯Ìm, ûe to nedok·ûÌ dokonce ani kov·¯i ve mÏstÏ.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_05"); //A to je taky dob¯e. Jinak by vöichni ty mÏstsk˝ ochlastovÈ ve str·ûi nosili magickÈ meËe.
		if (other.guild == GIL_MIL)
		{	
			AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_06"); //Nic proti tobÏ. (k¯enÌ se) Vypad·ö, ûe jsi v pohodÏ.
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_07"); //Kdybych mÏl magickou rudu, dokonce i j· bych to tak udÏlal.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_08");//Ale, no t··k - jsem s ûold·kama a umÌm kovat - co jinÈho chceö?
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_09"); //M˘ûeö mi tedy potom ¯Ìct, jak m·m ukovat zbraÚ z magickÈ rudy bez pouûitÌ magickÈ rudy?
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_10");//Noooo...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_11"); //To jsem si myslel. Pot¯ebuju nejmÈnÏ 5 hrudek tÈ rudy - nebo na to rovnou zapomeÚ.
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else //alles OK
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_12"); //SkvÏle, p¯inesl jsi mi rudu a takÈ vÌö, jak ukovat norm·lnÌ meË.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_13");//No, tak tedy povÌdej.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_14"); //Nejd˘leûitÏjöÌ vÏc je: Nez·leûÌ na tom, zdali je tv· cel· zbraÚ vyroben· z magickÈ rudy, nebo jestli m·ö pokrytou jen obyËejnou ocelovou Ëepel vrstvou rudy. Povrch je to, na Ëem z·leûÌ.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_15"); //A protoûe je ten mizernej materi·l tak drahej, popadni ocelovej prut a pouûij p·r hrud rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_16"); //P¯irozenÏ z toho nevznikne nic jin˝ho, neû ûe to jenom pokryje hotov˝ meË magickou rudou. Budeö muset ukovat ten meË od zaË·tku.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_17"); //Vöechno ostatnÌ z·visÌ na zbrani, kterou chceö vyrobit.
		Bennet_TeachSmith = TRUE;
	};
};

// ************************************************************
// 			  				WhereOre
// ************************************************************
instance DIA_Bennet_WhereOre (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 8;
	condition	= DIA_Bennet_WhereOre_Condition;
	information	= DIA_Bennet_WhereOre_Info;
	permanent	= FALSE;
	description	= "Kde mohu najÌt magickou rudu?";
};

func int DIA_Bennet_WhereOre_Condition ()
{
	if (MIS_Bennet_BringOre == LOG_RUNNING)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WhereOre_15_00"); //Kde m˘ûu najÌt magickou rudu?
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_01"); //No, kdybych tohle jenom vÏdÏl. NÏjak· urËitÏ bude v tÏûa¯skÈ kolonii.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_02"); //Ale moûn· budeö mÌt ötÏstÌ a najdeö tady v okolÌ p·r zbytk˘.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_03"); //MyslÌm, ûe v hor·ch jiûnÏ odsud jsou nÏjakÈ doly. Moûn· ûe bys tam mÏl vÏtöÌ ötÏstÌ.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_04"); //Ale d·vej bacha, slyöel jsem, ûe se to tam hemûÌ banditama.
};

// ************************************************************
// 			  				BringOre
// ************************************************************
instance DIA_Bennet_BringOre (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 9;
	condition	= DIA_Bennet_BringOre_Condition;
	information	= DIA_Bennet_BringOre_Info;
	permanent	= FALSE;
	description	= "Tum·ö - 5 kousk˘ rudy.";
};

func int DIA_Bennet_BringOre_Condition ()
{
	if (MIS_Bennet_BringOre == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Nugget) >= 5)
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BringOre_15_00"); //Tady m·ö - 5 zlat˝ch.
	AI_Output (self, other, "DIA_Bennet_BringOre_06_01"); //(smÏje se) Ukaû!
	B_GiveInvItems (other, self, itmi_nugget, 5);
	AI_Output (self, other, "DIA_Bennet_BringOre_06_02"); //SkuteËnÏ! Tohle mÏ fakt srazilo k zemi!
	AI_Output (self, other, "DIA_Bennet_BringOre_06_03"); //DvÏ si nech. Budeö je pot¯ebovat, abys mohl ukovat svojÌ vlastnÌ zbraÚ.
	B_GiveInvItems (self,other, itmi_nugget, 2);
	MIS_Bennet_BringOre = LOG_SUCCESS;
};

// ************************************************************
// 			  				  Teach 
// ************************************************************
var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;
// ---------------------------------

FUNC VOID B_SayBennetLATER()
{
	AI_Output	(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Ne, jeötÏ ne. Vraù se pozdÏji.
};
instance DIA_Bennet_TeachSmith		(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 30;
	condition	= DIA_Bennet_TeachSmith_Condition;
	information	= DIA_Bennet_TeachSmith_Info;
	permanent	= TRUE;
	description	= "ChtÏl bych umÏt kovat zbranÏ z magickÈ rudy.";
};

func int DIA_Bennet_TeachSmith_Condition ()
{
	if (Bennet_TeachSmith == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TeachSmith_15_00"); //Chci vÏdÏt vÌc o kutÌ zbranÌ z magickÈ rudy.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		B_SayBennetLATER();
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_01"); //Mohu tÏ nauËit, jak kovat meËe z magickÈ rudy nebo dokonce obouruËnÌ zbranÏ.
		Bennet_Kap2Smith = TRUE;
	}
	else if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_02"); //Zdokonalil jsem svojÌ techniku. NynÌ tÏ mohu nauËit, jak vytvo¯it s pomocÌ rudy tÏûkÈ meËe nebo tÏûkÈ obouruËnÌ meËe.
		Bennet_Kap3Smith = TRUE;
	}
	else if (MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_03"); //MyslÌm, ûe jsem se tentokr·t p¯ekonal. Vytvo¯il jsem dvÏ bojovÈ Ëepele. To je ta nejlepöÌ vÏc, jakou jsem doteÔ vidÏl.
		Bennet_Kap4Smith = TRUE;
	}
	else if (Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_04"); //Poslyö. MyslÌm, ûe jsem pr·vÏ dostal dokonal˝ n·pad. ZbranÏ z magickÈ rudy, zakalenÈ draËÌ krvÌ. A j· p¯esnÏ vÌm, jak na to p˘jdu!
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_05"); //(zubÌ se) Chceö to vÏdÏt?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_06"); //Jakou zbraÚ bys chtÏl vyrobit?
	};
	
	Info_ClearChoices (DIA_Bennet_TeachSmith);
	Info_AddChoice (DIA_Bennet_TeachSmith, DIALOG_BACK, DIA_Bennet_TeachSmith_BACK);
	// ------ Kapitel 2 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_01 , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,DIA_Bennet_TeachSmith_1hSpecial1);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,DIA_Bennet_TeachSmith_2hSpecial1);
	};
	// ------ Kapitel 3 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,DIA_Bennet_TeachSmith_1hSpecial2);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,DIA_Bennet_TeachSmith_2hSpecial2);
	};
	// ------ Kapitel 4 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_03))		,DIA_Bennet_TeachSmith_1hSpecial3);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_03))		,DIA_Bennet_TeachSmith_2hSpecial3);
	};
	// ------ Kapitel 5 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
	&& (Kapitel >= 5)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_04))		,DIA_Bennet_TeachSmith_1hSpecial4);
	};  
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
	&& (Kapitel >= 5)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_04))		,DIA_Bennet_TeachSmith_2hSpecial4);
	};
};

FUNC VOID DIA_Bennet_TeachSmith_Back ()
{
	Info_ClearChoices (DIA_Bennet_TeachSmith);
};
func VOID DIA_Bennet_TeachSmith_1hSpecial1 ()
{
	
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_01);	
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial1 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_01);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_02);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_02);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_03);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_03);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial4 ()
{
	
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_04);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial4 ()
{

	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_04);
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

INSTANCE DIA_Bennet_KAP3_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP3_EXIT_Condition;
	information	= DIA_Bennet_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//*********************************************************************
//	Was machst du hier im Knast?
//*********************************************************************
instance DIA_Bennet_WhyPrison		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_WhyPrison_Condition;
	information	 = 	DIA_Bennet_WhyPrison_Info;
	permanent	 = 	FALSE;
	description	 = 	"A proË ses vlastnÏ dostal do lochu?";
};

func int DIA_Bennet_WhyPrison_Condition ()
{
	IF (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhyPrison_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_00"); //Za co ses dostal do lochu?
	AI_Output	(self , other,"DIA_Bennet_WhyPrison_06_01"); //Ty svinÏ mÏ hodily do t˝hle dÌry. Pr˝ jsem zavraûdil paladina.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_02"); //Ale j· jsem to neudÏlal, oni se to jenom pokouöÌ na mÏ hodit.
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_03"); //ProË by to dÏlali?
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_04"); //Jak to m·m vÏdÏt? MÏl bys mÏ odtud dostat.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_05"); //Promluv s lordem Hagenem, probourej zeÔ, je to jedno - prostÏ nÏco udÏlej!
	
	MIS_RescueBennet = LOG_RUNNING; 
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet je v pÏknÈ bryndÏ a teÔ by udÏlal cokoliv, jen aby se dostal z basy."); 
};

//*********************************************************************
//	Was ist passiert?
//*********************************************************************
instance DIA_Bennet_WhatHappened		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_WhatHappened_Condition;
	information	 = 	DIA_Bennet_WhatHappened_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co se stalo?";
};

func int DIA_Bennet_WhatHappened_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhatHappened_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_00"); //Co se stalo?
	AI_Output	(self , other,"DIA_Bennet_WhatHappened_06_01"); //äel jsem do centra s Hodgesem nakoupit nÏjak˝ z·soby pro naöe chlapce.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_02"); //Najednou jsme uslyöeli hlasit˝ v˝k¯ik a zvuk, jako by nÏkdo bÏûel.
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_03"); //Jdi p¯Ìmo k vÏci.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_04"); //VÏdÏli jsme najednou, ûe se nÏco stalo a ûe n·s chytÌ, kdyû n·s tam nÏkdo uvidÌ.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_05"); //BÏûeli jsme jak o ûivot. Potom, tÏsnÏ p¯edtÌm, neû jsme dobÏhli k mÏstskÈ br·nÏ, jsem zakopnul a vyvrknul jsem si kotnÌk.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_06"); //Zbytek je uû jednoduchej. Najednou u mÏ byla domobrana, a ta mÏ odvlekla rovnou do t˝hle dÌry.
};

//*********************************************************************
//	Wer ist ermordet worden?
//*********************************************************************
instance DIA_Bennet_Victim		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Victim_Condition;
	information	 = 	DIA_Bennet_Victim_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kdo byl zavraûdÏn?";
};

func int DIA_Bennet_Victim_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Victim_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_00"); //Kdo byl zavraûdÏn?
	AI_Output	(self , other,"DIA_Bennet_Victim_06_01"); //Nem·m ponÏtÌ - jeden z paladin˘, v˘bec je nezn·m.
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_02"); //Jak se jmenoval?
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_03"); //NÏjak˝ Lothar, myslÌm. No, nevÌm, opravdu si nejsem jistej.
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_04"); //Radöi by ses mÏl zeptat lorda Hagena, on zn· vöechny detaily.

	B_LogEntry (TOPIC_RESCUEBENNET,"Lothar, jeden z paladin˘, byl zavraûdÏn. BliûöÌ informaci by mi mohl podat Lord Hagen, kter˝ vede celÈ vyöet¯ov·nÌ.");
};

//*********************************************************************
//	Haben sie Beweise gegen dich?
//*********************************************************************
instance DIA_Bennet_Evidence		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Evidence_Condition;
	information	 = 	DIA_Bennet_Evidence_Info;
	permanent	 = 	FALSE;
	description	 = 	"MajÌ proti tobÏ nÏjak˝ d˘kaz?";
};

func int DIA_Bennet_Evidence_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Evidence_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_00"); //MajÌ proti tobÏ nÏjak˝ d˘kaz?
	AI_Output	(self , other,"DIA_Bennet_Evidence_06_01"); //ÿÌkajÌ, ûe majÌ nÏjakÈho svÏdka, kter˝ mÏ poznal.
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_02"); //NevÌö n·hodou, kdo je ten svÏdek?
	AI_Output 	(self ,other ,"DIA_Bennet_Evidence_06_03"); //Ne. Vöechno, co vÌm, je, ûe je to lh·¯.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Jeden svÏdek tvrdÌ, ûe Benneta vidÏl. MusÌm ho najÌt a zjistit, jak to bylo doopravdy.");
	
	RescueBennet_KnowsWitness = TRUE; 
};


//*********************************************************************
//	Wer f¸hrt die Untersuchungen durch?
//*********************************************************************
instance DIA_Bennet_Investigation		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Investigation_Condition;
	information	 = 	DIA_Bennet_Investigation_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kdo vede vyöet¯ov·nÌ?";
};

func int DIA_Bennet_Investigation_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_Evidence))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Investigation_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_00"); //Kdo vede vyöet¯ov·nÌ?
	AI_Output	(self , other,"DIA_Bennet_Investigation_06_01"); //S·m lord Hagen. A protoûe obÏtÌ byl jeden z paladin˘, spad· tenhle p¯Ìpad pod v·leËn˝ soud.
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_02"); //Co to znamen·?
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_03"); //To je jednoduch˝ uhodnout. Pokud se odtud nedostanu, bez okolk˘ mÏ povÏsÌ.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_04"); //MusÌö mi pomoct, nebo tady bude v·lka. Lee to nenech· jen tak.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_05"); //M˘ûeö si d·t dohromady s·m, co to znamen·.
};


//*********************************************************************
//	Mann, ich hatte echt schon geglaubt, dass die mich h‰ngen! 
//*********************************************************************
instance DIA_Bennet_ThankYou		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_ThankYou_Condition;
	information	 = 	DIA_Bennet_ThankYou_Info;
	permanent	 = 	FALSE;
	Important	 =	TRUE;
};

func int DIA_Bennet_ThankYou_Condition ()
{
	IF (MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_ThankYou_Info ()
{
	if (hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild (other, GIL_DJG);
	};

	AI_Output	(self ,other,"DIA_Bennet_ThankYou_06_00"); //Chlape, uû jsem si myslel, ûe mÏ v·ûnÏ povÏsÌ!
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_01"); //No, nakonec to dob¯e dopadlo.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_02"); //To mi povÌdej. MÏl jsi vidÏt ksicht toho voj·ka, kdyû mÏ musel pustit ven!
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_03"); //(smÏje se) Byl tak vystraöenej, ûe si skoro nadÏlal do kalhot.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_04"); //Coû mi p¯ipomÌn·, ûe pro tebe nÏco m·m.
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_05"); //Co myslÌö?
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_06"); //(k¯enÌ se) D·reËek.
	
};

//*********************************************************************
//	Was f¸r ein Geschenk?
//*********************************************************************

instance DIA_Bennet_Present		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Present_Condition;
	information	 = 	DIA_Bennet_Present_Info;
	permanent	 = 	FALSE;
	description	 =	"Jak˝ d·reËek?";
};

func int DIA_Bennet_Present_Condition ()
{
	IF (Npc_KnowsInfo (other,DIA_Bennet_ThankYou))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Present_Info ()
{
	AI_Output	(other,self ,"DIA_Bennet_Present_15_00"); //Jak˝ d·reËek?
	
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_01"); //Slyöeli jsme o dracÌch, co by mÏli ˙dajnÏ bejt v ˙dolÌ.
	AI_Output	(other,self ,"DIA_Bennet_Present_15_02"); //Oni tam skuteËnÏ jsou!
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_03"); //Dob¯e, j· ti vÏ¯Ìm.
	
	if (hero.guild == GIL_DJG)
	{
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_04"); //V kaûdÈm p¯ÌpadÏ se p·r chlapc˘ rozhodlo jÌt do ˙dolÌ.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_05"); //(zubÌ se) MajÌ v pl·nu to tam trochu uklidit.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_06"); //A co to m· co dÏlat se mnou?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_07"); //(pyönÏ) Vytvo¯il jsem nov˝ typ brnÏnÌ. BrnÏnÌ drakobijc˘!
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_08"); //Je robustnÏjöÌ a lehËÌ neû norm·lnÌ brnÏnÌ.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_09"); //A protoûe jsi mÏ zachr·nil, chci, abys dostal prvnÌ kus. Je to dar!
			
		CreateInvItems (self,ITAR_DJG_L,1);
		B_GiveInvItems (self,other,ITAR_DJG_L,1);
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_10"); //Myslel jsem, ûe by se ti to mohlo hodit. Budeö pot¯ebovat to spr·vnÈ vybavenÌ, neû p˘jdeö tam dol˘ do ˙dolÌ.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_11"); //TakÈ mÏ zajÌmajÌ draËÌ öupiny. OpravdovÈ draËÌ öupiny. SluönÏ ti za nÏ zaplatÌm.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_12"); //Kolik dostanu za jednu öupinu?
		B_Say_Gold (self,other,Value_DragonScale); 
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_13"); //KromÏ toho jsem si myslel, ûe by sis asi nechtÏl nechat ten draËÌ hon ujÌt.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_14"); //A?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_15"); //Tady, vezmi si tenhle amulet. MyslÌm, ûe ho budeö pot¯ebovat vÌc neû j·.
	
		CreateInvItems (self,ItAm_Hp_01,1); 
		B_GiveInvItems (self,other,ItAm_Hp_01,1);
	};
};


//*********************************************************************
//		DragonScale
//*********************************************************************

//-------------------------------------------------
	var int Bennet_DragonScale_Counter;
	var int Show_DJG_Armor_M;
//-------------------------------------------------

instance DIA_Bennet_DragonScale		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DragonScale_Condition;
	information	 = 	DIA_Bennet_DragonScale_Info;
	permanent	 = 	TRUE;
	description	 =	"M·m pro tebe p·r draËÌch öupin.";
};

func int DIA_Bennet_DragonScale_Condition ()
{
	IF (Npc_HasItems (other,ItAt_Dragonscale) > 0)
	&& (hero.guild == GIL_DJG)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DragonScale_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DragonScale_15_00"); //M·m pro tebe p·r draËÌch öupin.
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_01"); //OpravdovÈ draËÌ öupiny!
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_02"); //Tady je tvÈ zlato!
	
	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter +(Npc_HasItems (other,ItAT_Dragonscale)));
	
	B_GiveInvItems (self ,other,ItMi_Gold,(Npc_HasItems(other,ItAT_Dragonscale) * Value_DragonScale) ); 
	B_GiveInvItems (other,self ,ItAt_Dragonscale,(Npc_HasItems (other,ItAT_Dragonscale)));
	
	
	if (Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_03"); //Dob¯e, to by staËilo. Mohl bych ti prodat novÈ, vylepöenÈ brnÏnÌ, pokud bys mÏl z·jem.
		
		Show_DJG_Armor_M = TRUE;
	};
};

//*********************************************************************
//		DJG_ARMOR_M
//*********************************************************************

//-----------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;
//-----------------------------

instance DIA_Bennet_DJG_ARMOR_M		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DJG_ARMOR_M_Condition;
	information	 = 	DIA_Bennet_DJG_ARMOR_M_Info;
	permanent	 = 	TRUE;
	description	 =	"St¯ednÏ tÏûk· drakobijeck· zbroj: Ochrana: zbranÏ 80, öÌpy 80 (12000 zlat˝ch)"; //Wenn ‰ndern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_M_Condition ()
{
	IF (Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Show_DJG_Armor_M == TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DJG_ARMOR_M_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_00"); //Chci si koupit novÈ brnÏnÌ.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_01"); //Velmi dob¯e. Bude se ti lÌbit.
		AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_02"); //Za tu cenu by opravdu mÏlo.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_03"); //ZjistÌö, ûe to brnÏnÌ stojÌ za kaûdej ten zlaù·k.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_04"); //Nem·ö dost zlata.
	};	
	
};

//*********************************************************************
//		Ich weiss, wie man die R¸stung noch mehr verbessern kann.
//*********************************************************************

instance DIA_Bennet_BetterArmor		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_BetterArmor_Condition;
	information	 = 	DIA_Bennet_BetterArmor_Info;
	permanent	 = 	FALSE;
	description	 =	"VÌm, jak se m˘ûe brnÏnÌ jeötÏ vÌce vylepöit.";
};

func int DIA_Bennet_BetterArmor_Condition ()
{
	IF (PlayerGetsFinalDJGArmor == TRUE)
	&& (hero.guild == GIL_DJG)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_BetterArmor_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_00"); //VÌm, jak brnÏnÌ jeötÏ vÌc vylepöit.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_01"); //(usmÌv· se) Tak mi to ¯ekni.
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_02"); //Mohl bys pokr˝t draËÌ öupiny magickou rudou.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_03"); //(smÏje se) Tohle mÏ uû taky napadlo. A m·ö pravdu.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_04"); //Moje nejnovÏjöÌ brnÏnÌ p¯edËÌ vöechno, co jsi doposud vidÏl. Je teÔ lehkÈ a masivnÌ.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_05"); //Je PERFEKTNÕ.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_06"); //M˘ûeö si ho koupit, jestli chceö. Ned·v·m tuhle nabÌdku jen tak nÏkomu a navÌc cena zahrnuje pouze v˝robnÌ n·klady.
};


//*********************************************************************
//		DJG_ARMOR_H
//*********************************************************************

//---------------------------------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;
//---------------------------------------------------

instance DIA_Bennet_DJG_ARMOR_H		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DJG_ARMOR_H_Condition;
	information	 = 	DIA_Bennet_DJG_ARMOR_H_Info;
	permanent	 = 	TRUE;
	description	 =	"TÏûk· drakobijeck· zbroj: Ochrana: zbranÏ 90, öÌpy 90. (20000 zlat˝ch)"; //Wenn ‰ndern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_H_Condition ()
{
	IF (Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo (other,DIA_Bennet_BetterArmor))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DJG_ARMOR_H_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_H_15_00"); //Dej mi to brnÏnÌ.
	
	if (Npc_HasItems (other,itmi_Gold) >= 20000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_01"); //Tohle je nejlepöÌ brnÏnÌ, jakÈ jsem kdy vyrobil.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_02"); //Opravdov˝ skvost.
		
		B_GiveInvItems (other,self,ItMi_Gold,20000);
		CreateInvItems (self,ITAR_DJG_H,1);
		B_GiveInvItems (self,other,ITAR_DJG_H,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_03"); //Nem·ö dost zlata.
	};	
	
};
//*********************************************************************
//	Kannst du auch Schmuckst¸cke reparieren?
//*********************************************************************
instance DIA_Bennet_RepairNecklace		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_RepairNecklace_Condition;
	information	 = 	DIA_Bennet_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"UmÌö opravit i klenoty?";
};

func int DIA_Bennet_RepairNecklace_Condition ()
{
	if 	(MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	&&	((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
	||   (MIS_SCKnowsInnosEyeIsBroken  == TRUE)) 
  	{
  		return TRUE;
  	};
};

func void DIA_Bennet_RepairNecklace_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_RepairNecklace_15_00"); //UmÌö opravit i klenoty?
	AI_Output			(self, other, "DIA_Bennet_RepairNecklace_06_01"); //Z·leûÌ na tom jakÈ. Nejd¯Ìv mi ukaû, co m·ö na mysli.
	
	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_02"); //Taky se odsud musÌm nejd¯Ìv dostat.
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_03"); //DO tÈ doby ti tu vÏc z¯ejmÏ neopravÌm.
	};	
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};

//*********************************************************************
//		Hier wird das Amulett repariert
//*********************************************************************

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_ShowInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_ShowInnosEye_Condition;
	information	 = 	DIA_Bennet_ShowInnosEye_Info;
	permanent	 = 	FALSE;
	description	 = 	"M˘ûeö se podÌvat na tenhle amulet?";
};

func int DIA_Bennet_ShowInnosEye_Condition ()
{
	if (Npc_HasItems (other,ItMi_InnosEye_Broken_MIS))
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
 	{
    	return TRUE;
  	};

};

func void DIA_Bennet_ShowInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //M˘ûeö se podÌvat na tenhle amulet?
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //JasnÏ, ukaû mi ho.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //Hmm, to je skuteËnÏ n·dhern· pr·ce. Oprava bude z·hul. Ale myslÌm si, ûe jsem schopnej to opravit.
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //Jak dlouho ti to potrv·?
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_04"); //No, teÔ jsem se zaseknul tady. Nebo tu snad vidÌö nÏkde dÌlnu?
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_05"); //Kdybych byl ve svÈ kov·rnÏ, byl bych schopnej to vöechno udÏlat za jeden den. Ale samoz¯ejmÏ se musÌm nejd¯Ìv dostat ven.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //Pokud mi ho tu nech·ö, bude hotovej do doby, neû se sem zÌtra vr·tÌö.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //A dokonce ti to ani nebudu ˙Ëtovat. Vûdyù jsi mÏ dostal ven z lochu.
	};
	
	B_LogEntry (TOPIC_INNOSEYE, "Bennet je ten prav˝ kov·¯, kter˝ mi opravÌ ten amulet.");

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
};

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_GiveInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_GiveInnosEye_Condition;
	information	 = 	DIA_Bennet_GiveInnosEye_Info;
	permanent	 = 	FALSE;
	description	 = 	"Tady je ten amulet, prosÌm oprav mi ho.";
};

func int DIA_Bennet_GiveInnosEye_Condition ()
{
	IF (Npc_HasItems (other,ItMi_InnosEye_Broken_Mis)	>=1)
	&& (MIS_SCKnowsInnosEyeIsBroken  == TRUE)
	&& (MIS_REscueBennet == LOG_SUCCESS)
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	{
		return TRUE;
	};	                                                                             
};

func void DIA_Bennet_GiveInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //Tady je ten amulet, oprav mi ho, prosÌm.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //Dob¯e. Budu to mÌt opravenÈ do zÌt¯ka.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //Tak si pak pro nÏj p¯ijÔ.
	
	Npc_RemoveInvItems	(other,	ItMi_InnosEye_Broken_Mis,1);
	AI_PrintScreen (Print_InnoseyeGiven, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
	Bennet_RepairDay = Wld_GetDay ();	
};



///////////////////////////////////////////////////////////////////////
//	Kannst du mir dieses Amulett reparieren?
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_GetInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_GetInnosEye_Condition;
	information	 = 	DIA_Bennet_GetInnosEye_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je amulet hotov˝?";
};

func int DIA_Bennet_GetInnosEye_Condition ()
{
	IF (Npc_KnowsInfo (other,DIA_Bennet_GiveInnosEye)
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)) 
	{
		return TRUE;
	};	
};

func void DIA_Bennet_GetInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_GetInnosEye_15_00"); //Je amulet hotov˝?
	
	if (Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_01"); //Ano, tady je.
	
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems (other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen (Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_02"); //Musel jsem tam zasadit nov˝ k·men.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_03"); //Pracoval jsem na nÏm celou noc. Koukni na to,  vypad· jako nov˝.
		
		B_LogEntry (TOPIC_INNOSEYE, "Amulet je opÏt cel˝, Bennet odvedl skvÏlou pr·ci.");
		
		MIS_Bennet_InnosEyeRepairedSetting   = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_InnosEyeIsRepaired);
	}
	else
	{	//Hack Mattes
		B_SayBennetLATER();
		//AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm sp‰ter wieder.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_05"); //Kdyû mÏ budeö zdrûovat, bude to trvat dÈle.
		
		AI_StopProcessInfos (self);
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

INSTANCE DIA_Bennet_KAP4_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP4_EXIT_Condition;
	information	= DIA_Bennet_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dracheneier
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DRACHENEIER		(C_INFO)
{
	npc		 = 	SLD_809_Bennet;
	nr		 = 	5;
	condition	 = 	DIA_Bennet_DRACHENEIER_Condition;
	information	 = 	DIA_Bennet_DRACHENEIER_Info;
	permanent	 = 	TRUE;

	description	 = 	"M˘ûeö nÏco udÏlat s draËÌmi vejci?";
};

func int DIA_Bennet_DRACHENEIER_Condition ()
{
	if (Kapitel >= 4)
	&& (BennetsDragonEggOffer == 0)
	&& (Npc_HasItems (other,ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG)
		{
				return TRUE;
		};
};
var int BennetsDragonEggOffer;
var int DRACHENEIER_angebotenXP_OneTime;
func void DIA_Bennet_DRACHENEIER_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //D· se nÏco udÏlat s draËÌmi vejci?
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //DraËÌmi vejci? Jak jsi k nim krucin·l p¯iöel?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //Vzal jsem je jeötÏr˘m.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //Ukaû mi to.
	};

	Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //Mmh. Velmi öikovn˝ materi·l. Ide·lnÌ k dokonËenÌ brnÏnÌ. Teda pokud se mi je poda¯Ì rozlousknout.
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //Takûe co bude? Chceö je?
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //JasnÏ! Dej je sem.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //Jak dlouho tu budeö s tou vÏcÌ m·vat? Chceö, abych to koupil, nebo ne?
	};

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //ZaplatÌm ti, hmm, ¯eknÏme, 300 zlat˝ch za kaûdÈ draËÌ vejce, kterÈ mi p¯ineseö.

	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Tak si svoje zlato nech. MyslÌm, ûe si to nech·m.", DIA_Bennet_DRACHENEIER_nein );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Tohle jsou draËÌ vejce, ne slepiËÌ...", DIA_Bennet_DRACHENEIER_mehr );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Dohodnuto.", DIA_Bennet_DRACHENEIER_ok );

	IF (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet je ochoten mi dob¯e zaplatit za vöechna draËÌ vejce, kter· mu p¯inesu."); 
	B_GivePlayerXP (XP_DJG_BringDragonEgg);
	DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Bennet_DRACHENEIER_ok ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //Dohodnuto.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //Dob¯e.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //Kdyû jeötÏ na nÏco takovÈho narazÌö, urËitÏ mi to p¯ines.

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;	
	};

	CreateInvItems (self, ItMi_Gold, BennetsDragonEggOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	BennetsDragonEggOffer);

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //Ehm. ÿÌk·ö, ûes je vzal jeötÏr˘m?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //Spr·vnÏ.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //Z toho, co jsem slyöel, tak vÏtöina jeötÏr˘ bydlÌ v jeskynÌch.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //Nep¯ekvapilo by mÏ, kdybys naöel vÌc tÏchhle vÏcÌ v jeskynÌch tady v okolÌ.
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet si myslÌ, ûe bych se po vejcÌch mÏl podÌvat v khorinidsk˝ch jeskynÌch, kde by mÏli jeötÏ¯i p¯eb˝vat."); 
	
	AI_Output (self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //Tady. Vem si tuhle mapu. Ta ti pom˘ûe najÌt ty jeskynÏ.
	CreateInvItems (self, ItWr_Map_Caves_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_Caves_MIS,1);
	B_LogEntry (TOPIC_DRACHENEIER,"Dal mi mapu jeskynÌ, kter· by mi mÏla pomoci."); 
	
	if (1 == 2) //MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //Nejd¯Ìv ale musÌö zÌskat mapu jeskynÌ od kartografa ve mÏstÏ. Byla by to ökoda, kdybys je nemohl najÌt vöechny.
		B_LogEntry (TOPIC_DRACHENEIER,"MÏl bych si u mÌstnÌho kartografa obstarat mapu jeskynÌ, aby mi û·dnÈ vejce neuniklo."); 
	};
	
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //Tohle jsou draËÌ vejce, ne bezcenn· slepiËÌ vajÌËka.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //(podr·ûdÏnÏ) Dob¯e. Tak 350. Ale vÌc ti za nÏ uû d·t nem˘ûu - pak by se mi to nevyplatilo.
	BennetsDragonEggOffer =	350;
};

func void DIA_Bennet_DRACHENEIER_nein ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //Tak si nech svoje zlato. MyslÌm, ûe si to nech·m.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_nein_06_01"); //Dej mi vÏdÏt, aû si to rozmyslÌö.

	CreateInvItems (other, ItAt_DragonEgg_MIS, 1);									
	AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

	BennetsDragonEggOffer = 0;
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

///////////////////////////////////////////////////////////////////////
//	Info EierBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_EierBringen		(C_INFO)
{
	npc		 = 	SLD_809_Bennet;
	nr		 = 	5;
	condition	 = 	DIA_Bennet_EierBringen_Condition;
	information	 = 	DIA_Bennet_EierBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"ZajÌmajÌ tÏ jeötÏ dalöÌ draËÌ vejce?";
};

func int DIA_Bennet_EierBringen_Condition ()
{
	if (BennetsDragonEggOffer > 0)
	&& (Kapitel >= 4)
	&& (Npc_HasItems (other,ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG)
		{
				return TRUE;
		};
};

var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_EierBringen_15_00"); //ZajÌmajÌ tÏ jeötÏ dalöÌ draËÌ vejce?
	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_01"); //JistÏ!

	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	
	DragonEggCount = Npc_HasItems(other, ItAt_DragonEgg_MIS);


	if (DragonEggCount == 1)
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_02"); //Tady. M·m dalöÌ.
			B_GivePlayerXP (XP_DJG_BringDragonEgg);
			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
			AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
			DragonEggCounter = DragonEggCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_03"); //M·m tady jeötÏ nÏjak˝.

			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	DragonEggCount);
			concatText = ConcatStrings(IntToString(DragonEggCount), PRINT_ItemsGegeben);		// "x Gegenst‰nde gegeben"
			AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			XP_DJG_BringDragonEggs = (DragonEggCount * XP_DJG_BringDragonEgg);
			DragonEggCounter = (DragonEggCounter + DragonEggCount); 

			B_GivePlayerXP (XP_DJG_BringDragonEggs);
		};

	if (DragonEggCounter <= 7)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_04"); //SkvÏle. Dej to sem. DÌval ses po nich vöude? JistÏ musÌ nÏkde b˝t jeötÏ nÏjakÈ.
	}
	else if	(DragonEggCounter <= 11)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_05"); //Kde tyhle vÏciËky v˘bec po¯·d nach·zÌö? VsadÌm se, ûe uû jich tady moc nebude.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_06"); //NemyslÌm si, ûe jeötÏ nÏco najdeö. A j· uû toho m·m tolik, ûe ani nevÌm, co s tÌm budu dÏlat.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_07"); //Jo, spr·vnÏ. Tady m·ö penÌze.

	DragonEggGeld	= (DragonEggCount * BennetsDragonEggOffer);

	CreateInvItems (self, ItMi_Gold, DragonEggGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, DragonEggGeld);
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

INSTANCE DIA_Bennet_KAP5_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP5_EXIT_Condition;
	information	= DIA_Bennet_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_KnowWhereEnemy_Condition;
	information	 = 	DIA_Bennet_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Pot¯ebuju se dostat na ostrov. Mohl bych vzÌt kov·¯e.";
};
func int DIA_Bennet_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Bennet_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Bennet_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //Pot¯ebuju se dostat na ostrov. Kov·¯ by se mi mohl hodit.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //A tÌm jako myslÌö mÏ.
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //Jo. Co na to ¯Ìk·ö? ÿÌkals p¯ece, ûe bys odsud r·d vypadnul.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //Je to lepöÌ neû Onarova farma. ChlapËe, myslÌm, ûe ani v pekle to nebude horöÌ. PoËÌtej se mnou.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Bennet by mohl odejÌt klidnÏ hned teÔ. Jeho kov·¯skÈmu umÏnÌ se hned tak nÏkdo nevyrovn· a j· se od nÏj mohu leccos p¯iuËit.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Bennet_KnowWhereEnemy_15_04"); //Moje pos·dka je v tuhle chvÌli kompletnÌ.
		AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //Pak tedy jednoho z nich poöli zase pryË.
	}
	else 
	{
		Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"D·m ti vËas vÏdÏt, aû tÏ budu pot¯ebovat. ",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Tak buÔ tedy m˝m kov·¯em. Sejdeme se v p¯Ìstavu!",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_Yes_15_00"); //Tak tedy buÔ m˝m kov·¯em. UvidÌme se v p¯Ìstavu.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01"); //Dob¯e. UvidÌme se pozdÏji.
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_No_15_00"); //D·m ti vËas vÏdÏt, aû tÏ budu pot¯ebovat.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_No_06_01"); //Fajn. Budu tady.

	Bennet_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_LeaveMyShip		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_LeaveMyShip_Condition;
	information	 = 	DIA_Bennet_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Budu si muset najÌt jinÈho kov·¯e.";
};
func int DIA_Bennet_LeaveMyShip_Condition ()
{	
	if (Bennet_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bennet_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_LeaveMyShip_15_00"); //Budu si muset najÌt jinÈho kov·¯e.
	AI_Output			(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //Jednou je to takhle, a za chvÌli zase jinak. Dej si to v hlavÏ dohromady, jo? A aû budeö vÏdÏt, co vlastnÏ chceö, dej mi vÏdÏt.
	
	Bennet_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ZaËÌt"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir ¸berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_StillNeedYou_Condition;
	information	 = 	DIA_Bennet_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"PojÔ zp·tky. Nem˘ûu najÌt jin˝ho kov·¯e.";
};

func int DIA_Bennet_StillNeedYou_Condition ()
{	
	if ((Bennet_IsOnBOard == LOG_OBSOLETE)	
	|| (Bennet_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_Bennet_StillNeedYou_15_00"); //PojÔ zp·tky. Nem˘ûu najÌt jin˝ho kov·¯e.
	AI_Output	(self, other, "DIA_Bennet_StillNeedYou_06_01"); //(naötvanÏ) Spr·vnÏ! Jsem tu jenom j·, tak nikoho nehledej. UvidÌme se pozdÏji v docÌch.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	AI_StopProcessInfos (self);

		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bennet_PICKPOCKET (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 900;
	condition	= DIA_Bennet_PICKPOCKET_Condition;
	information	= DIA_Bennet_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bennet_PICKPOCKET_Condition()
{
	C_Beklauen (35, 45);
};
 
FUNC VOID DIA_Bennet_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bennet_PICKPOCKET);
	Info_AddChoice		(DIA_Bennet_PICKPOCKET, DIALOG_BACK 		,DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bennet_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bennet_PICKPOCKET);
};
	
func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bennet_PICKPOCKET);
};


























