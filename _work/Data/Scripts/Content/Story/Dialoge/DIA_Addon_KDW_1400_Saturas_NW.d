///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_EXIT   (C_INFO)
{
	npc         = KDW_1400_Addon_Saturas_NW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Saturas_EXIT_Info()
{
	if (MIS_Addon_Saturas_BringRiordian2Me == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //Siccome non vuoi proprio impedire agli altri Maghi di fare il loro lavoro, potresti almeno portare un mio messaggio a uno di loro.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //Di' a Riordian che lo voglio vedere qui.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //Si trova in fondo alla cripta. Lo troverai là.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"Saturas vuole che gli mandi il Mago dell'Acqua Riordian. Dovrebbe trovarsi in fondo ai sotterranei del sito minerario."); 
	};
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Nefarius
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Nefarius		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Nefarius_Condition;
	information	 = 	DIA_Addon_Saturas_Nefarius_Info;
 
 	description	 = 	"Dovrei trovare le parti mancanti dell'ornamento per Nefarius.";
};

func int DIA_Addon_Saturas_Nefarius_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Nefarius_Info ()
{
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //Dovrei trovare le parti mancanti dell'ornamento per Nefarius.
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //Cosa? È incredibile! Ci sei di mezzo ancora tu?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //Non preoccuparti, ti porterò qui quelle cose.
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //(sospira) Almeno sai che cosa stai cercando?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //Nefarius mi ha dato questa mappa
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //Mostramela!
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //Mmmh... La grande foresta è molto pericolosa. Non dovresti andarci da solo.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //Cerca qualcuno che ti accompagni a Khorinis.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //Non voglio che tu finisca mangiato dai mostri… insieme all'ornamento.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //Eccoti la mappa

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas dice che non dovrei andare da solo nei boschi a cercare uno dei frammenti dell'ornamento. Dovrei andare a Khorinis a cercare qualcuno che mi accompagni."); 
	};
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Hallo		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Hallo_Condition;
	information	 = 	DIA_Addon_Saturas_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_Hallo_Condition ()
{
	Npc_PerceiveAll (self);
	if (Wld_DetectNpc (self,Gobbo_Skeleton,ZS_MM_Attack,-1) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Hallo_weißtdu ()
{
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_00"); //Hai una vaga idea di quello che hai combinato?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_01"); //Hai talmente alterato la struttura della magia che lo si sente persino a Khorinis.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_02"); //Considerati fortunato che un giorno la Barriera è crollata.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_weißtdu_15_03"); //Di cosa ti lamenti? In fondo ha funzionato.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_04"); //(urla) Tieni a freno la lingua!
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_05"); //(ribolle) Che cosa diavolo vuoi qui?
	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);

};

func void DIA_Addon_Saturas_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //Sei pazzo? Esci di qui.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //Queste cripte sono troppo pericolose per un avventuriero dilettante.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //(irritato) Ma dimmi, ti conosco, forse? Certo. Bastardo
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //(irritato) Non pensare che mi sia dimenticato di come ci hai tradito nel Campo nuovo.

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "(Imbarazzato) Io...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //(irritato) Hai sottratto alla nostra riserva di metallo tutto il potere magico e poi sei sparito come se niente fosse!
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //(irritato) Che cosa volevi fare?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Mi dispiace. Non sapevo cosa stavo facendo.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Il tuo piano non avrebbe funzionato comunque.", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Era necessario.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //Era necessario: senza il potere del metallo, non avrei mai potuto sconfiggere il Dormiente.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //(arrabbiato) Ma che diavolo dici? Dormiente? Sconfitto?
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //Il tuo piano non avrebbe funzionato comunque. Far saltare la Barriera con la riserva di metallo è stata la più grande sciocchezza che mi sia capitato di sentire.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //In conclusione, ti saresti fatto esplodere.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //(arrabbiato) Hai raggiunto il limite! Chi ti dà il diritto di giudicare noi e le nostre intenzioni?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //Se non fossi un uomo così pacifico, farei scendere su di te il furore di Adanos, ragazzo mio.
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //Mi dispiace. Non sapevo cosa stavo facendo.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //Oh? E pensi che questo sistemi tutto?
	DIA_Addon_Saturas_Hallo_weißtdu ();
};



///////////////////////////////////////////////////////////////////////
//	Info keineAhnung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_keineAhnung		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_keineAhnung_Condition;
	information	 = 	DIA_Addon_Saturas_keineAhnung_Info;

	description	 = 	"Non ne ho idea.";
};

func int DIA_Addon_Saturas_keineAhnung_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_keineAhnung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //Non ne ho idea. Volevo solo passare.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //Sprechi il mio tempo. Vattene da qui.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //(tra sé) Mi occuperò di te più tardi.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Ho trovato i Maghi dell'Acqua al loro sito minerario. Prima di tutto devo scoprire che cosa stanno facendo qui i ragazzi. Saturas non me lo ha saputo dire. È ancora molto teso quando si tratta delle vecchie storie sulla colonia penale."); 

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info raus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_raus		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_raus_Condition;
	information	 = 	DIA_Addon_Saturas_raus_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Addon_Saturas_raus_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_keineAhnung))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Saturas_raus_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //Vattene da qui prima che ti succeda qualcosa.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Lares
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Lares		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Lares_Condition;
	information	 = 	DIA_Addon_Saturas_Lares_Info;

	description	 = 	"Sono venuto qui con Lares.";
};

func int DIA_Addon_Saturas_Lares_Condition ()
{
	if (Lares_Angekommen == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Lares_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_00"); //Sono venuto qui con Lares.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //(preoccupato) Lares? Davvero? Dov'è?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //Sono qui da solo. Lares è tornato in città.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //Cosa? Ti ha mandato qui da noi da solo? Che cosa gli passava per la testa?
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Ornament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Ornament_Condition;
	information	 = 	DIA_Addon_Saturas_Ornament_Info;

	description	 = 	"Ti ho portato il tuo ornamento.";
};

func int DIA_Addon_Saturas_Ornament_Condition ()
{
	//if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Lares))
	//&& (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	if ( Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) && (Lares_Angekommen == FALSE) )
	|| ( (Lares_Angekommen == TRUE) && Npc_KnowsInfo(other, DIA_Addon_Saturas_Lares) && Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) )
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //Ti ho portato il tuo ornamento.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //Che cosa dovrebbe significare? 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //Chi te l'ha dato? Non dirmi che te lo ha dato Lares.
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //Piantala. Te l'ho portato io. Lo vuoi, no?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //Certamente. Ma mi secca che ci sia di nuovo TU di mezzo.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //Ma perché insisti con quella vecchia storia della riserva di metallo?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //Dopo tutto, ho già lavorato per te in passato. E non puoi dire che fossi inaffidabile.
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //(sospira) E che cosa ci ho guadagnato, in fin dei conti?  Bah, non credere che mi fidi di te...
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;

	//Joly: Monster auffüllen, die bei Lares gestört haben
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc 	(Giant_Bug, 	"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc 	(Lurker, 		"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 

	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
  	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, "NW_CITY_TO_FARM2_02"); //auf Treppe
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
};

///////////////////////////////////////////////////////////////////////
//	Info geheimbund
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_geheimbund		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_geheimbund_Condition;
	information	 = 	DIA_Addon_Saturas_geheimbund_Info;

	description	 = 	"Voglio unirmi all''Anello dell'Acqua'.";
};

func int DIA_Addon_Saturas_geheimbund_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_geheimbund_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //Voglio unirmi all''Anello dell'Acqua'.

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //(furioso) COSA? Come fai a conoscerlo? Chi…? LARES… Lo ucciderò!
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //Ha infranto la nostra prima regola. Non parlare a nessuno dell''Anello dell'Acqua'.
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //(affranto) Non so cosa dire. Mi fido di te solo se posso tenerti d'occhio.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //È stato Vatras a parlarmi dell'Anello.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //(rassegnato) Cosa? Vatras? (sarcastico) Magnifico! Di tutti i Maghi dell'Acqua sull'isola sei incappato proprio in quello che NON ti conosce.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //Ti avverto, non fare stupidaggini questa volta.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //(seccamente) Farò uno sforzo
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas non è pronto a lasciarmi entrare nell''Anello dell'Acqua'. Lascerà la decisione a Vatras."); 

};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_wasmachstdu		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_wasmachstdu_Condition;
	information	 = 	DIA_Addon_Saturas_wasmachstdu_Info;

	description	 = 	"Che cosa stai facendo quaggiù?";
};

func int DIA_Addon_Saturas_wasmachstdu_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_wasmachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_wasmachstdu_15_00"); //Che cosa stai facendo quaggiù?
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //(riverente) Queste sale nascondono antichi segreti. Segreti misteriosi.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //Le iscrizioni e gli affreschi parlano di una cultura molto antica.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //Tutto quello che vedi qui è scritto in una lingua che ci è totalmente sconosciuta.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //Cominciamo solo ora a impararla e a coglierne il significato.
};

///////////////////////////////////////////////////////////////////////
//	Info Erdbeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Erdbeben		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	6;
	condition	 = 	DIA_Addon_Saturas_Erdbeben_Condition;
	information	 = 	DIA_Addon_Saturas_Erdbeben_Info;

	description	 = 	"Che razza di terremoti sono?";
};

func int DIA_Addon_Saturas_Erdbeben_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_wasmachstdu))
	&& (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Bedrohung))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Erdbeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //Che razza di terremoti sono?
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //Questo è uno degli enigmi che sto cercando di risolvere.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //La struttura della magia è stata disturbata in qualche punto dietro a quelle montagne.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //Pare evidente che qualcuno stia cercando con tutto il suo potere di spezzare una magia potente.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //Temo che non ci vorrà molto prima che l'intera isola venga colpita da questi tremiti.
};
///////////////////////////////////////////////////////////////////////
//	Info WhatsOrnament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_WhatsOrnament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_WhatsOrnament_Condition;
	information	 = 	DIA_Addon_Saturas_WhatsOrnament_Info;

	description	 = 	"Perché questo ornamento è tanto importante per te?";
};

func int DIA_Addon_Saturas_WhatsOrnament_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsOrnament == FALSE)
	&& (RitualRingRuns == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_WhatsOrnament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //Perché questo ornamento è tanto importante per te?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //(irritato) È la chiave di un portale.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //Non ti dirò altro.
};
///////////////////////////////////////////////////////////////////////
//	Info ScRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ScRanger		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_ScRanger_Condition;
	information	 = 	DIA_Addon_Saturas_ScRanger_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ora appartengo all'Anello dell'Acqua.";
};

func int DIA_Addon_Saturas_ScRanger_Condition ()
{
	if (SaturasKnows_SC_IsRanger == FALSE)
	&& (SC_IsRanger == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ScRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //Ora faccio parte dell''Anello dell'Acqua'.
	var C_Item itm; 
	itm = Npc_GetEquippedArmor(other);
		
	if 	(
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC trägt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese Rüstung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //A quanto vedo, indossi l'armatura dei nostri figli.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //A quanto vedo, porti il nostro segno segreto. L'anello di acquamarina.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //E i tuoi occhi mi dicono che sei sincero.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //(borbottando) Molto bene. Accetterò il tuo ingresso nei nostri ranghi.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //Ma ricordati che questo comporta una grande responsabilità.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //E spero per il tuo bene che la onorerai.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas ha accettato la mia adesione all''Anello dell'Acqua'."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //E come faccio a sapere che ora sei uno di noi?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //L'anello di acquamarina che porti appartiene a Lares. Lo vedo benissimo.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // Stai cercando di imbrogliarmi, non è vero? Proprio come mi aspettavo.
			AI_StopProcessInfos (self);		
		};
};

///////////////////////////////////////////////////////////////////////
//	Info OpenPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_OpenPortal		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_OpenPortal_Condition;
	information	 = 	DIA_Addon_Saturas_OpenPortal_Info;
	permanent	 = 	TRUE;

	description	 = 	"Dammi l'anello. Aprirò il portale.";
};
var int DIA_Addon_Saturas_OpenPortal_NoPerm;
func int DIA_Addon_Saturas_OpenPortal_Condition ()
{
	if (RitualRingRuns == LOG_SUCCESS)
	&& (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_OpenPortal_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //Dammi l'anello. Aprirò il portale.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //(astutamente) Bene! Come nostro nuovo figlio, avrai questo onore.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //Tuttavia, sto ancora aspettando un messaggio da Vatras. Non possiamo andare finché non l'avrò ricevuto.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //Io HO un messaggio per te da Vatras.
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //(irritato) Capisco. E naturalmente non hai potuto trattenerti e hai dovuto aprirlo, vero?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //Beh, ecco
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //(minaccioso) Spero per il tuo bene che la mia fiducia in te, ormai appesa a un filo, non crolli definitivamente.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //(meravigliato) Davvero interessante. D'accordo.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //Ecco, prendi l'anello. Ci riuniremo al portale e ti aspetteremo.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //Se Nefarius ha ragione, il portale si aprirà non appena vi inserirai l'anello.
			
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry (TOPIC_Addon_Ornament,"Saturas mi ha dato l'anello ornamentale. Ora dovrei inserirlo nel meccanismo nel portale e attraversare il portale."); 

			AI_StopProcessInfos (self);		
			Npc_ExchangeRoutine	(self,"OpenPortal");
			B_StartOtherRoutine	(KDW_1401_Addon_Cronos_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1402_Addon_Nefarius_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1403_Addon_Myxir_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1404_Addon_Riordian_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1405_Addon_Merdarion_NW,"OpenPortal");
		}
		else
		{
			AI_StopProcessInfos (self);		
		};
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //Finché Vatras non mi farà capire chiaramente che posso fidarmi di te, terrò io l'anello.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas non mi darà l'anello fino a che Vatras non gli avrà fatto sapere che ci si può fidare di me."); 
		AI_StopProcessInfos (self);		
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PERM		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Saturas_PERM_Condition;
	information	 = 	DIA_Addon_Saturas_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Puoi insegnarmi qualcosa sulla magia?";
};

func int DIA_Addon_Saturas_PERM_Condition ()
{
	if (MIS_Addon_Saturas_BringRiordian2Me != 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //Puoi insegnarmi qualcosa sulla magia?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //Per permetterti di interferire di nuovo con la struttura della magia?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //No. Non ho tempo per questi giochetti.
};
