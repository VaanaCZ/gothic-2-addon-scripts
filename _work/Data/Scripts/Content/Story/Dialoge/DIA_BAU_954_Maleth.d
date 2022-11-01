///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Maleth_EXIT   (C_INFO)
{
	npc         = BAU_954_Maleth;
	nr          = 999;
	condition   = DIA_Maleth_EXIT_Condition;
	information = DIA_Maleth_EXIT_Info;
	permanent   = TRUE;
	description = "Musím jít!";
};
FUNC INT DIA_Maleth_EXIT_Condition()
{
	if (Kapitel	< 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Maleth_ersterWolf == FALSE)
	{
		Wld_InsertNpc		(YWolf,	"NW_FARM1_PATH_CITY_SHEEP_06");
		Maleth_ersterWolf = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Hallo (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_Hallo_Condition;
	information	= DIA_Maleth_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};

func int DIA_Maleth_Hallo_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Maleth_Hallo_08_00"); //Hej, cizinče!

	if (hero.guild == GIL_NONE)
		{
		
			if (Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_01"); //Vidęl jsem tę pâicházet z hor.
			};
			AI_Output (self, other, "DIA_Maleth_Hallo_08_02"); //Můžeš být rád, žes nepâišel pâed tâemi týdny.
			AI_Output (self, other, "DIA_Maleth_Hallo_08_03"); //Zatkli bychom tę jako uprchlého trestance. A udęlali bychom s tebou krátký proces!
			
			if (Npc_HasEquippedArmor(other) == FALSE) 
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_04"); //Vypadáš úplnę vyčerpanę.
			}
			else
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_05"); //Když jsi pâišel, vypadal jsi, že vypustíš duši.
				AI_Output (self, other, "DIA_Maleth_Hallo_08_06"); //Fajn, teë už vypadáš skoro jako človęk!
			};
		};

	AI_Output (self, other, "DIA_Maleth_Hallo_08_07"); //(nedůvęâivę) Co tady chceš?
};

///////////////////////////////////////////////////////////////////////
//	Banditen Überfall
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BANDITS		(C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BANDITS_Condition;
	information	= DIA_Maleth_BANDITS_Info;
	permanent   = FALSE;
	description	= "V horách mę pâepadli bandité.";
};

func int DIA_Maleth_BANDITS_Condition ()
{
	if (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BANDITS_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BANDITS_15_00"); //V horách mę pâepadli bandité.
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_01"); //Ti zatracení mizerové! Možná to budou ti, kteâí mi minulou noc ukradli jednu z ovcí!
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_02"); //Męls obrovské štęstí. Vętšina lidí se odtamtud nedostala živá.
};

///////////////////////////////////////////////////////////////////////
//	Banditen tot
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsDEAD	(C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsDEAD_Condition;
	information	= DIA_Maleth_BanditsDEAD_Info;
	permanent   = FALSE;
	description	= "Ti bandité už vám nebudou dęlat žádné problémy.";
};

func int DIA_Maleth_BanditsDEAD_Condition ()
{
	if ( Npc_IsDead (Ambusher_1013) || (Bdt_1013_Away == TRUE) )
	&& (Npc_IsDead (Ambusher_1014)) 
	&& (Npc_IsDead (Ambusher_1015))
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsDEAD_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_00"); //Ti bandité už vám nebudou dęlat žádné problémy.
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_01"); //Proč? Jsou mrtví?
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_02"); //Vytáhli zbraŕ na špatného chlapa.
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_03"); //Díky Innosovi! Tady - není to sice moc, ale chci, aby sis to vzal!
	B_GiveInvItems (self, other, ItFo_Wine, 3);
	
	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_MalethKillBandits);
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_04"); //Âeknu o tom ostatním!
};

///////////////////////////////////////////////////////////////////////
//	Banditen leben noch
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsALIVE (C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsALIVE_Condition;
	information	= DIA_Maleth_BanditsALIVE_Info;
	permanent   = FALSE;
	description	= "Vím, kde mají bandité skrýš.";
};

func int DIA_Maleth_BanditsALIVE_Condition ()
{
	var C_NPC b13; b13 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	var C_NPC b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_NPC b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);
	
	if ( (!Npc_IsDead (b13)) || (!Npc_IsDead (b14)) || (!Npc_IsDead (b15)) )
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	&& (MIS_Maleth_Bandits != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsALIVE_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsALIVE_15_00"); //Vím, kde mají bandité skrýš.
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_01"); //Chceš na nę jít? Tak z toho mę vynech! Je to moc nebezpečný!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_02"); //A kromę toho, musím dávat pozor na ovce!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_03"); //Ale jestli si myslíš, že nás té lůzy můžeš zbavit, bude ti celá farma vdęčná.
	MIS_Maleth_Bandits = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Maleth,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Maleth,LOG_RUNNING);
	B_LogEntry (TOPIC_Maleth,"Jestli se mi podaâí pobít bandity na cestę z Xardasovy vęže na Lobartův statek, jeho obyvatelé mi budou velmi vdęční.");
	
};


///////////////////////////////////////////////////////////////////////
//	Auf dem Weg in die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_ToTheCity (C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 2;
	condition	= DIA_Maleth_ToTheCity_Condition;
	information	= DIA_Maleth_ToTheCity_Info;
	permanent   = FALSE;
	description	= "Jsem na cestę do męsta.";
};

func int DIA_Maleth_ToTheCity_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_ToTheCity_Info ()
{
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_00"); //Jsem na cestę do męsta.
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_01"); //Asi budeš muset podplatit stráže, aby ses dostal, kam chceš.
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_02"); //A taky musíš vędęt, co chtęjí slyšet.
	}
	else
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_03"); //Můžou tę pustit dovnitâ - když jim âekneš, co chtęj slyšet.
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_04"); //A to jako?
	AI_Output (self, other, "DIA_Maleth_ToTheCity_08_05"); //Tâeba... že jsi z Lobartovy farmy a potâebuješ za męstským kováâem.
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Když strážím u męstských bran âeknu, že pâicházím z Lobartova statku a že mám namíâeno ke kováâi, pustí mę dovnitâ.");
	
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_06"); //Ale asi ti to nebude moc platné. Nevypadáš jako farmáâ.
		B_LogEntry (TOPIC_City,"Samozâejmę že napâed musím vypadat taky jako sedlák.");
		
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_07"); //Aha.
};
	
	
	

///////////////////////////////////////////////////////////////////////
//	Bessere Ausrüstung
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Equipment		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_Equipment_Condition;
	information	= DIA_Maleth_Equipment_Info;
	permanent   = FALSE;
	description	= "Potâebuju lepší vybavení!";
};

func int DIA_Maleth_Equipment_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_Equipment_Info ()
{
	AI_Output (other, self, "DIA_Maleth_Equipment_15_00"); //Potâebuju lepší vybavení!
	AI_Output (self, other, "DIA_Maleth_Equipment_08_01"); //To chápu. Ale âeknu ti rovnou: Nemáme nic, co bychom mohli postrádat!
	if (!Npc_IsDead(Lobart))
	{
		AI_Output (self, other, "DIA_Maleth_Equipment_08_02"); //Pokud můžeš zaplatit za to, co chceš, Lobart ti nęco prodá.
		AI_Output (self, other, "DIA_Maleth_Equipment_08_03"); //Jinak se ho také můžeš zeptat, jestli by pro tebe nemęl nęjakou práci.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Lobart
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_LOBART		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_LOBART_Condition;
	information	= DIA_Maleth_LOBART_Info;
	permanent   = FALSE;
	description	= "Kde můžu najít Lobarta?";
};

func int DIA_Maleth_LOBART_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Equipment))
	&& (!Npc_IsDead(Lobart))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_LOBART_Info ()
{
	AI_Output (other, self, "DIA_Maleth_LOBART_15_00"); //Kde můžu najít Lobarta?
	AI_Output (self, other, "DIA_Maleth_LOBART_08_01"); //No, na farmę pâece! Patâí mu to tady!
	AI_Output (self, other, "DIA_Maleth_LOBART_08_02"); //A nezkoušej si s ním nęco začínat! Už hodnę tuláků od nęj dostalo nakládačku a pak letęli z farmy.
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

INSTANCE DIA_Maleth_KAP3_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP3_EXIT_Condition;
	information	= DIA_Maleth_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info probleme
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PROBLEME		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	30;
	condition	 = 	DIA_Maleth_PROBLEME_Condition;
	information	 = 	DIA_Maleth_PROBLEME_Info;

	description	 = 	"Nęjaký zmęny poslední dobou?";
};

func int DIA_Maleth_PROBLEME_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_PROBLEME_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_15_00"); //Nęjaký zmęny poslední dobou?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_01"); //Sejdi dolů po cestę k męstu a uvidíš.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_02"); //Až se potkáš s černokabátníky, pak uvidíš, co je nového.
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Jak se mají ovce?", DIA_Maleth_PROBLEME_schafe );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Už tę ty černé kápę navštívily?", DIA_Maleth_PROBLEME_beidir );
	
};
func void DIA_Maleth_PROBLEME_beidir ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_beidir_15_00"); //Už tę ty černé kápę navštívily?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_beidir_08_01"); //Jo. Zůstaly tu nękolik dní. Jestli to chceš vędęt, tak pâišly rovnou z pekel.

};

func void DIA_Maleth_PROBLEME_schafe ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_15_00"); //Jak se mají ovce?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_08_01"); //(vztekle) Jako by tę to vůbec zajímalo. Máš jiné problémy.
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Problémy? Co ty o tom víš?", DIA_Maleth_PROBLEME_schafe_probleme );

};
func void DIA_Maleth_PROBLEME_schafe_probleme ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_15_00"); //Problémy? Co ty o tom víš?
	
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_01"); //(stroze) Patâíš k męstským strážím, ne? Tak s tęma bastardama v černých kápích nęco udęlej.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_02"); //(vztekle) Vy zatracený žoldáci myslíte jen na jedinou vęc: jak z ostatních dostat co nejvíc penęz do vlastní kapsy.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_03"); //Váš vznešený pán kláštera by męl s tęmi postavami v kápích nęco dęlat.
		};

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Hej, dávej si bacha na pusu, kámo.", DIA_Maleth_PROBLEME_schafe_probleme_drohen );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Info_AddChoice	(DIA_Maleth_PROBLEME, "Co máš za problém?", DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag );
		};
};

func void DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00"); //Co máš za problém?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01"); //Určitę za to může ta černá pálenka, co mi Vino pâed nękolika týdny podstrčil.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02"); //Nemůžu si na nic vzpomenout, chlape. Jenom vím, že se mi ztratila moje vycházková hůl.
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03"); //A kvůli tomu dęláš takovej kravál?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04"); //Tobę se to âekne, tvoje nebyla.
	
	Log_CreateTopic (TOPIC_MalethsGehstock, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock, LOG_RUNNING);
	B_LogEntry (TOPIC_MalethsGehstock,"Maleth se nękde ožral jak dęlo a ztratil pâitom vycházkovou hůl. Jak ho znám, nikdy se z Lobartova statku moc nevzdálil. Proto by se ta hůl męla válet nękde poblíž."); 

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEME_schafe_probleme_drohen ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00"); //Hej, dávej si bacha na pusu, kámo.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01"); //Jediný, co ti jde, jsou âeči. Nejlíp udęláš, když půjdeš pryč.
};

func void DIA_Maleth_PROBLEME_Back ()
{
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

///////////////////////////////////////////////////////////////////////
//	Info Gehstock
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_GEHSTOCK		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_GEHSTOCK_Condition;
	information	 = 	DIA_Maleth_GEHSTOCK_Info;

	description	 = 	"Mám dojem, že tahle hůl patâí tobę.";
};

func int DIA_Maleth_GEHSTOCK_Condition ()
{
	if (Npc_HasItems (other,ItMw_MalethsGehstock_MIS))
	&& (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
		{
				return TRUE;
		};
};

func void DIA_Maleth_GEHSTOCK_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_00"); //Mám dojem, že tahle hůl patâí tobę.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_01"); //To je ohromný. Já...
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_02"); //Tak moment. Nejdâív za ni zaplaă.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_03"); //Ale... Moc toho nemám.
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_04"); //V tom pâípadę na ni zapomeŕ.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_05"); //DObrá. A co tohle? Včera jsem tu vidęl bęžet nęjaký bandity s nękolika męšci zlata.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_06"); //Když ti âeknu, kam schovali svou koâist, vrátíš mi za to moji hůl?
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP (XP_FoundMalethsGehstock);

	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "Promiŕ, ale to mę nezajímá. Chci zlato.", DIA_Maleth_GEHSTOCK_gold );
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "Dobrá.", DIA_Maleth_GEHSTOCK_ok );
};
func void DIA_Maleth_GEHSTOCK_ok ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_ok_15_00"); //Dobrá.
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_01"); //Fajn. Jdi odsud na západ k tamtomu kousku lesa. Najdeš tam strž.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_02"); //V tý jeskyni určitę nęco bude.

	B_LogEntry (TOPIC_MalethsGehstock,"Maleth mi vyprávęl, že v lesích západnę od Lobartova statku se nachází tábor banditů."); 
	CreateInvItems 		(BDT_1024_MalethsBandit, ItMi_MalethsBanditGold,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos (self);
};

func void DIA_Maleth_GEHSTOCK_gold ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_gold_15_00"); //Promiŕ, ale to mę nezajímá. Chci zlato.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_gold_08_01"); //Tady je všechno, co mám. Męlo by to stačit.
	CreateInvItems 		(self, Itmi_Gold, 35);
	B_GiveInvItems 		(self, other, Itmi_Gold,35);
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PERM3		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_PERM3_Condition;
	information	 = 	DIA_Maleth_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nenech se vůbec rušit.";
};

func int DIA_Maleth_PERM3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
	&& (Kapitel >= 3)
			{
					return TRUE;
			};
};

func void DIA_Maleth_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PERM3_15_00"); //Nenech se vůbec rušit.
	AI_Output			(self, other, "DIA_Maleth_PERM3_08_01"); //(rozčilenę) Zmizni.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Maleth_KAP4_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP4_EXIT_Condition;
	information	= DIA_Maleth_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP4_EXIT_Info()
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

INSTANCE DIA_Maleth_KAP5_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP5_EXIT_Condition;
	information	= DIA_Maleth_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP5_EXIT_Info()
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


INSTANCE DIA_Maleth_KAP6_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP6_EXIT_Condition;
	information	= DIA_Maleth_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maleth_PICKPOCKET (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 900;
	condition	= DIA_Maleth_PICKPOCKET_Condition;
	information	= DIA_Maleth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Maleth_PICKPOCKET_Condition()
{
	C_Beklauen (10, 10);
};
 
FUNC VOID DIA_Maleth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maleth_PICKPOCKET);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_BACK 		,DIA_Maleth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maleth_PICKPOCKET_DoIt);
};

func void DIA_Maleth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};
	
func void DIA_Maleth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};






































































