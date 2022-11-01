
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //(naštvanę) To je dost, že jdeš. Už tu na tebe čekám hezkejch pár hodin.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //(zmatenę) Moment, ty nejseš vobchodník z męsta, že ne?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //(naštvanę) Kde je Baltram?
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //Sice ti po tom nic není, ale když už to chceš vędęt, jmenuju se Skip. Nepâipomíná ti to nic?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //(pâedstírá, že nerozumí) Kdože to?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //To mi chceš namluvit, žes o Skipovi nikdy neslyšel? Ty vole, kde to žiješ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Sem jeden z nejhledanęjších khorinidskejch zločinců. Já a mí chlapi jsme už celý léta postrachem vod kolem tohohle pâipitomęlýho ostrova.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //(rozhoâčenę) Ale no tak, určitę už jsi o mnę slyšel.
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Ty jsi pirát.", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "My se známe?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "No jasnę, už se mi to všecko vybavuje.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //Ale samozâejmę, už si vzpomínám.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //(zmatenę) Vážnę? Ty už jsi o mnę vážnę slyšel?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //Doprdele! A já si âíkal, že se projdu po męstę.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //Eštęže jsem to neudęlal.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //Domobrana by mę hned zavâela do lapáku.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //Ale ty mę nepráskneš, že ne?
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Noooo...
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //Dobâe dęláš. Páč když se se starým Skipem pustíš do kâížku, seš mrtvej muž.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //Męl bych tę snad znát?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Pozor na hubu, chlape, nebo ti starej Skip dá co proto.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Ty jsi pirát.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //(naštvanę) Jo, sakra, to je snad jasný na první pohled. A pęknę zákeânej.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //Už mę nudí furt vokousávat prkna svý lodi.
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

	description	 = 	"Baltram? Ty čekáš na kupce?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //Baltram? Ty čekáš na kupce?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //Ty seš ŕákej chytrej.
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //Sem to snad právę âek, ne?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Jenže ten nanicovatej kupčík na mę nejspíš zapomnęl.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //Dostat ho tak do ruky...
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Pirát Skip mi naznačil, že místní kupec Baltram obchoduje s piráty."); 
	
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

	description	 = 	"Mám pro tebe balíček - od Baltrama.";
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
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //Mám pro tebe balík – od Baltrama.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //Cože? Von si posílá poslíčky?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Je celej posranej strachy, co? No jo, co bych taky vod toho starýho skrblíka chtęl.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //Tvrdil, že za to chce 3 lahve rumu.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //(smęje se) To by se mu líbilo! Napâed mę tu nechá celou vęčnost čekat, ani se tu osobnę neukáže, a pak má eštę tu drzost vymejšlet si takovýhle krávoviny.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Tumáš, dej mu dvę flašky, to mu stačí.
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

	description	 = 	"Odkud jsi pâišel?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //Odkud pocházíš?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //Chceš vędęt, kde se ukrejváme?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //To je to poslední, co bych nękomu z domobrany vyžvanil.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Kdybych ti to âek, to už můžu rovnou pozvat domobranu, aă mę zatkne.
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //A pokud bys nás chtęl navštívit, nehnul bych pro tebe ani prstem.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //Ostrov Khorinis je velkej, ale tam, co sme my, se beztak nikdo nedostane. Pokud teda nemá ŕákou loë.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //A pak eštę musíš znát cestu pâes útesy. Nikdo tamtudy nepropluje, když nezná tajnou trasu.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //A tu znaj akorát dva lidi – a ty mezi nę nepatâíš.
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

	description	 = 	"Znáš nękoho, kdo nosí pásku pâes oko?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //Neznáš nękoho s páskou pâes oko?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //Znám hromadu chlapů s páskama pâes voko.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //Po Khorinidu chodí nękdo, kdo tę pravdępodobnę dost dobâe zná.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //Nemám tucha, kdo by to moh bejt, se suchozemskejma krysama se nebavim.
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

	description	 = 	"Pohâešují se nęjací místní lidé.";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Spousta zdejších obyvatel se pohâešuje a všecko poukazuje na to, že bys o tom mohl nęco vędęt.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //(cítí se zaskočen) No... sakra, není to tak, jak si myslíš.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //Copak vypadám jako ŕákej votrokáâ? Ne, pâevážim akorát zboží. Co je to zač a vodkuë je, to nejni můj problém.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //My pro tu svini už pâeváželi snad všecko.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //Napâed to byly normální vęci. No, vobčas to bylo pašovaný.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Ale pak začali unášet lidi z tohohle męsta. Netušim, co s nima chtęli dęlat.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //My je akorát pâeváželi na místo.
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

	description	 = 	"O kom to mluvíš?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //O kom to mluvíš?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //Banditi, samozâejmę, kdo jinej? Ta špinavá sebranka, co se tu rozlezla po celým vostrovę.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //A nejenom tady kolem Khorinidu.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //Teë už si vzpomínám – Dexter. Jo, myslim, že mu âíkali Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Obyvatele Khorinidu unášel vůdce banditů Dexter. Męl bych ho najít jižnę od Onarova statku."); 

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

	description	 = 	"'Banditi'? To mi nestačí. Chci nęjaké konkrétní jméno.";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //Jenom 'banditi' mi nestačí. Potâebuji jméno.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //Jméno? To chceš jako vędęt, kdo ty bandity vede? Do hajzlu, jak se ten šmejd jenom jmenoval...?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Hmm, teë si na to nemůžu vzpomenout, i když to nebylo moc složitý.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Ale můžu ti ukázat, kde najdeš šéfa gangu z týhle části Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //Máš ŕákou slušnou mapu?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //Mapu mám tady.
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Ale ta už je počmáraná. To nemá cenu, když ji nemůžu počmárat já.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //Ne.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //Tak ti to budu muset popsat.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //Na východę je fakt velkej statek, šéfuje mu ŕákej Onar, myslím.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //Má pár docela velkejch polí. A na jih od nich je na vysokým útesu malá pevnůstka.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //A tam toho chlapa najdeš.
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

	description	 = 	"Tady. Mám mapu Khorinidu.";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //Tady mám mapu Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //To je dobrý. Tak já ti tam zakreslím, kde se ten chlápek schovává.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Tady máš tu mapu.
	
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //Už jsem ti âek – neâeknu ti, kde leží naše zátoka.
};
