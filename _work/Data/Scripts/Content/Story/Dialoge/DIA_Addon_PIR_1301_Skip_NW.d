
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skip_NW_EXIT   (C_INFO)
{
	npc         = PIR_1301_Addon_Skip_NW;
	nr          = 999;
	condition   = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	PlayerTalkedToSkipNW = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Skip_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Skip_NW_Hallo_Info;
	important	 = 	TRUE;
};
func int DIA_Addon_Skip_NW_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //(naötvanÏ) To je dost, ûe jdeö. Uû tu na tebe Ëek·m hezkejch p·r hodin.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //(zmatenÏ) Moment, ty nejseö vobchodnÌk z mÏsta, ûe ne?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //(naötvanÏ) Kde je Baltram?
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_WerBistDu_Condition;
	information	 = 	DIA_Addon_Skip_NW_WerBistDu_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //Kdo jsi?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //Sice ti po tom nic nenÌ, ale kdyû uû to chceö vÏdÏt, jmenuju se Skip. Nep¯ipomÌn· ti to nic?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //(p¯edstÌr·, ûe nerozumÌ) Kdoûe to?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //To mi chceö namluvit, ûes o Skipovi nikdy neslyöel? Ty vole, kde to ûijeö?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Sem jeden z nejhledanÏjöÌch khorinidskejch zloËinc˘. J· a mÌ chlapi jsme uû cel˝ lÈta postrachem vod kolem tohohle p¯ipitomÏl˝ho ostrova.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //(rozho¯ËenÏ) Ale no tak, urËitÏ uû jsi o mnÏ slyöel.
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Ty jsi pir·t.", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "My se zn·me?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "No jasnÏ, uû se mi to vöecko vybavuje.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //Ale samoz¯ejmÏ, uû si vzpomÌn·m.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //(zmatenÏ) V·ûnÏ? Ty uû jsi o mnÏ v·ûnÏ slyöel?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //Doprdele! A j· si ¯Ìkal, ûe se projdu po mÏstÏ.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //EötÏûe jsem to neudÏlal.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //Domobrana by mÏ hned zav¯ela do lap·ku.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //Ale ty mÏ nepr·skneö, ûe ne?
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Noooo...
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //Dob¯e dÏl·ö. P·Ë kdyû se se star˝m Skipem pustÌö do k¯Ìûku, seö mrtvej muû.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //MÏl bych tÏ snad zn·t?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Pozor na hubu, chlape, nebo ti starej Skip d· co proto.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Ty jsi pir·t.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //(naötvanÏ) Jo, sakra, to je snad jasn˝ na prvnÌ pohled. A pÏknÏ z·ke¯nej.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //Uû mÏ nudÌ furt vokous·vat prkna sv˝ lodi.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};
///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Baltram		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Baltram_Condition;
	information	 = 	DIA_Addon_Skip_NW_Baltram_Info;

	description	 = 	"Baltram? Ty Ëek·ö na kupce?";
};

func int DIA_Addon_Skip_NW_Baltram_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //Baltram? Ty Ëek·ö na kupce?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //Ty seö Ú·kej chytrej.
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //Sem to snad pr·vÏ ¯ek, ne?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Jenûe ten nanicovatej kupËÌk na mÏ nejspÌö zapomnÏl.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //Dostat ho tak do ruky...
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Pir·t Skip mi naznaËil, ûe mÌstnÌ kupec Baltram obchoduje s pir·ty."); 
	
	SCKnowsBaltramAsPirateTrader = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BaltramPaket
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_BaltramPaket		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_BaltramPaket_Condition;
	information	 = 	DIA_Addon_Skip_BaltramPaket_Info;

	description	 = 	"M·m pro tebe balÌËek - od Baltrama.";
};

func int DIA_Addon_Skip_BaltramPaket_Condition ()
{
	if (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //M·m pro tebe balÌk ñ od Baltrama.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //Coûe? Von si posÌl· poslÌËky?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Je celej posranej strachy, co? No jo, co bych taky vod toho star˝ho skrblÌka chtÏl.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //Tvrdil, ûe za to chce 3 lahve rumu.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //(smÏje se) To by se mu lÌbilo! Nap¯ed mÏ tu nech· celou vÏËnost Ëekat, ani se tu osobnÏ neuk·ûe, a pak m· eötÏ tu drzost vymejölet si takov˝hle kr·voviny.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Tum·ö, dej mu dvÏ flaöky, to mu staËÌ.
	CreateInvItems (self, ItFo_Addon_Rum, 2);									
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);

	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Woher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Woher		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Woher_Condition;
	information	 = 	DIA_Addon_Skip_NW_Woher_Info;

	description	 = 	"Odkud jsi p¯iöel?";
};

func int DIA_Addon_Skip_NW_Woher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_WerBistDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Woher_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //Odkud poch·zÌö?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //Chceö vÏdÏt, kde se ukrejv·me?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //To je to poslednÌ, co bych nÏkomu z domobrany vyûvanil.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Kdybych ti to ¯ek, to uû m˘ûu rovnou pozvat domobranu, aù mÏ zatkne.
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //A pokud bys n·s chtÏl navötÌvit, nehnul bych pro tebe ani prstem.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //Ostrov Khorinis je velkej, ale tam, co sme my, se beztak nikdo nedostane. Pokud teda nem· Ú·kou loÔ.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //A pak eötÏ musÌö zn·t cestu p¯es ˙tesy. Nikdo tamtudy nepropluje, kdyû nezn· tajnou trasu.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //A tu znaj akor·t dva lidi ñ a ty mezi nÏ nepat¯Ìö.
};


///////////////////////////////////////////////////////////////////////
//	Info SCSawGreg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_SCSawGreg		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_SCSawGreg_Condition;
	information	 = 	DIA_Addon_Skip_SCSawGreg_Info;

	description	 = 	"Zn·ö nÏkoho, kdo nosÌ p·sku p¯es oko?";
};

func int DIA_Addon_Skip_SCSawGreg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (SC_KnowsConnectionSkipGreg == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_SCSawGreg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //Nezn·ö nÏkoho s p·skou p¯es oko?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //Zn·m hromadu chlap˘ s p·skama p¯es voko.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //Po Khorinidu chodÌ nÏkdo, kdo tÏ pravdÏpodobnÏ dost dob¯e zn·.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //Nem·m tucha, kdo by to moh bejt, se suchozemskejma krysama se nebavim.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //Ale...
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //Nech to bejt, fakt je mi to u prdele.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_MissingPeople		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_MissingPeople_Condition;
	information	 = 	DIA_Addon_Skip_NW_MissingPeople_Info;

	description	 = 	"Poh¯eöujÌ se nÏjacÌ mÌstnÌ lidÈ.";
};

func int DIA_Addon_Skip_NW_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Spousta zdejöÌch obyvatel se poh¯eöuje a vöecko poukazuje na to, ûe bys o tom mohl nÏco vÏdÏt.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //(cÌtÌ se zaskoËen) No... sakra, nenÌ to tak, jak si myslÌö.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //Copak vypad·m jako Ú·kej votrok·¯? Ne, p¯ev·ûim akor·t zboûÌ. Co je to zaË a vodkuÔ je, to nejni m˘j problÈm.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //My pro tu svini uû p¯ev·ûeli snad vöecko.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //Nap¯ed to byly norm·lnÌ vÏci. No, vobËas to bylo paöovan˝.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Ale pak zaËali un·öet lidi z tohohle mÏsta. Netuöim, co s nima chtÏli dÏlat.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //My je akor·t p¯ev·ûeli na mÌsto.
};
///////////////////////////////////////////////////////////////////////
//	Info Dexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Dexter		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Dexter_Condition;
	information	 = 	DIA_Addon_Skip_NW_Dexter_Info;

	description	 = 	"O kom to mluvÌö?";
};

func int DIA_Addon_Skip_NW_Dexter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Dexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //O kom to mluvÌö?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //Banditi, samoz¯ejmÏ, kdo jinej? Ta öpinav· sebranka, co se tu rozlezla po cel˝m vostrovÏ.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //A nejenom tady kolem Khorinidu.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //TeÔ uû si vzpomÌn·m ñ Dexter. Jo, myslim, ûe mu ¯Ìkali Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Obyvatele Khorinidu un·öel v˘dce bandit˘ Dexter. MÏl bych ho najÌt jiûnÏ od Onarova statku."); 

	SC_KnowsDexterAsKidnapper = TRUE;			
	Ranger_SCKnowsDexter = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Name
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Name		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Name_Condition;
	information	 = 	DIA_Addon_Skip_NW_Name_Info;

	description	 = 	"'Banditi'? To mi nestaËÌ. Chci nÏjakÈ konkrÈtnÌ jmÈno.";
};

func int DIA_Addon_Skip_NW_Name_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Dexter))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Name_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //Jenom 'banditi' mi nestaËÌ. Pot¯ebuji jmÈno.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //JmÈno? To chceö jako vÏdÏt, kdo ty bandity vede? Do hajzlu, jak se ten ömejd jenom jmenoval...?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Hmm, teÔ si na to nem˘ûu vzpomenout, i kdyû to nebylo moc sloûit˝.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Ale m˘ûu ti uk·zat, kde najdeö öÈfa gangu z t˝hle Ë·sti Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //M·ö Ú·kou sluönou mapu?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //Mapu m·m tady.
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Ale ta uû je poËm·ran·. To nem· cenu, kdyû ji nem˘ûu poËm·rat j·.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //Ne.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //Tak ti to budu muset popsat.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //Na v˝chodÏ je fakt velkej statek, öÈfuje mu Ú·kej Onar, myslÌm.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //M· p·r docela velkejch polÌ. A na jih od nich je na vysok˝m ˙tesu mal· pevn˘stka.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //A tam toho chlapa najdeö.
		B_Skip_SaysDextersName ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Landkarte		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Landkarte_Condition;
	information	 = 	DIA_Addon_Skip_NW_Landkarte_Info;

	description	 = 	"Tady. M·m mapu Khorinidu.";
};

func int DIA_Addon_Skip_NW_Landkarte_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Name))
	&& (Npc_HasItems (other,ItWr_Map_NewWorld))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Landkarte_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //Tady m·m mapu Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //To je dobr˝. Tak j· ti tam zakreslÌm, kde se ten chl·pek schov·v·.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Tady m·ö tu mapu.
	
	Npc_RemoveInvItems	(self,ItWr_Map_NewWorld ,1 );
	CreateInvItems (self, ItWr_Map_NewWorld_Dexter, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Dexter, 1);		
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Wohin		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Skip_NW_Wohin_Condition;
	information	 = 	DIA_Addon_Skip_NW_Wohin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Kam jsi ty lidi odvlekl?";
};

func int DIA_Addon_Skip_NW_Wohin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Wohin_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //Kam jsi ty lidi unesl?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //Uû jsem ti ¯ek ñ ne¯eknu ti, kde leûÌ naöe z·toka.
};
