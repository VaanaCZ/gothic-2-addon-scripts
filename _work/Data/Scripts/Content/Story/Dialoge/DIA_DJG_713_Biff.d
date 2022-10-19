func void B_KommMit ()
{
	AI_Output (other, self,"DIA_AkilsSchaf_KommMit_15_00");	//Pojë za mnou!
};
func void B_BIFF_VERARSCHEN ()
{
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_lebenlassen_07_01"); //Nemám zapotâebí, aby si ze mê nêkdo dêlal blázny.
};

func void B_BiffsAnteil_Berechnung() //Joly: Wieviel Kohle muß der SC Biff nun geben:
{	
	var int momentanKohle;
	var int UeberschussKohle;
	momentanKohle = Npc_HasItems(hero,ItMi_Gold);
	UeberschussKohle = (momentanKohle - DJG_Biff_SCGold);
	BiffsAnteil = ((UeberschussKohle)/2);
};

func void B_BiffsAnteil_PrintScreen ()
{
	var string BiffsAnteilText_Teil;
	var string BiffsAnteilText;
	var string Anteil;
	Anteil = IntToString (BiffsAnteil);
	BiffsAnteilText_Teil = ConcatStrings(PRINT_BiffsAnteil, Anteil);		
	BiffsAnteilText	= ConcatStrings(BiffsAnteilText_Teil, PRINT_BiffGold);	
	AI_PrintScreen	(BiffsAnteilText, -1, 45, FONT_ScreenSmall, 4);
};
func void B_Biff_SetRefuseTalk ()	//Joly: Biffs Geld eintreiberei kommt beim HalbeHalbe Deal nicht so häufig.
{
	if (DJG_Biff_HalbeHalbe == TRUE)
	{
		Npc_SetRefuseTalk (Biff,1000);//Joly:Biff stehet hier wegen INIT und setrefusetalk. SAVEGAMEFIX
	}
	else
	{
		Npc_SetRefuseTalk (Biff,600);//Joly:Biff stehet hier wegen INIT und setrefusetalk. SAVEGAMEFIX
	};
};
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Biff_EXIT   (C_INFO)
{
	npc         = DJG_713_Biff;
	nr          = 999;
	condition   = DIA_Biff_EXIT_Condition;
	information = DIA_Biff_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Biff_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Biff_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_HALLO		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	5;
	condition	 = 	DIA_Biff_HALLO_Condition;
	information	 = 	DIA_Biff_HALLO_Info;

	description	 = 	"Co tady dêláš?";
};

func int DIA_Biff_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Biff_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_15_00"); //Co tady dêláš?
	AI_Output			(self, other, "DIA_Biff_HALLO_07_01"); //To je ta nejblbêjší otázka, jakou jsem kdy slyšel. Co asi tak myslíš?

	Info_AddChoice	(DIA_Biff_HALLO, "Z tak pâiblblýho výrazu, jakej máš ty, se nedá nic poznat.", DIA_Biff_HALLO_spott );
	Info_AddChoice	(DIA_Biff_HALLO, "Nemám tucha.", DIA_Biff_HALLO_keineAhnung );
	Info_AddChoice	(DIA_Biff_HALLO, "To nic.", DIA_Biff_HALLO_doof );
};

func void DIA_Biff_HALLO_doof ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_doof_15_00"); //To nic.
	Info_ClearChoices	(DIA_Biff_HALLO);
};

func void DIA_Biff_HALLO_spott ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_spott_15_00"); //Z tak pâiblblýho výrazu, jakej máš ty, se nedá nic poznat. Proto jsem se taky musel zeptat.
	AI_Output			(self, other, "DIA_Biff_HALLO_spott_07_01"); //Na mùj vkus máš nêjak moc velkou hubu. Je naèase, aby ti ji nêkdo zavâel.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};

func void DIA_Biff_HALLO_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_15_00"); //Tak o tom nemám ani tucha.
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_07_01"); //Èekám, co se tu nakonec semele.

	Info_AddChoice	(DIA_Biff_HALLO, "Co èekáš, že se stane?", DIA_Biff_HALLO_keineAhnung_was );
};
func void DIA_Biff_HALLO_keineAhnung_was ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_15_00"); //Co èekáš, že se stane?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_07_01"); //Hele chlape, ty sis vážnê nebyl dvakrát, když Innos rozdával rozum. Kdybych to vêdêl, na nic bych neèekal.

	Info_AddChoice	(DIA_Biff_HALLO, "Tak co se chystá?", DIA_Biff_HALLO_keineAhnung_was_was2 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_15_00"); //Tak co se chystá?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_07_01"); //Už mi lezeš na nervy. Hele, nestarám se o to, co se stane. Až do tý chvíle, kdy se to stane.

	Info_AddChoice	(DIA_Biff_HALLO, "Tak proè nêco nedêláš?", DIA_Biff_HALLO_keineAhnung_was_was2_was3 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2_was3 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00"); //Tak proè nêco nedêláš?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01"); //Jestli mi okamžitê nepâestaneš dávat ty pâiblblý otázky, tak ti tu tvojí nevymáchanou hubu rychle zavâu.


	Info_AddChoice	(DIA_Biff_HALLO, "Když tu budeš jen tak èekat, nikdy se nic nestane!", DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00"); //Když tu budeš jen tak èekat, nikdy se nic nestane!
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01"); //Jo, tak to je!

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);	
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};


///////////////////////////////////////////////////////////////////////
//	Info washierimTal
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_WASHIERIMTAL		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	7;
	condition	 = 	DIA_Biff_WASHIERIMTAL_Condition;
	information	 = 	DIA_Biff_WASHIERIMTAL_Info;

	description	 = 	"Co doufáš, že tu najdeš?";
};

func int DIA_Biff_WASHIERIMTAL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Biff_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Biff_WASHIERIMTAL_Info ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_15_00"); //Co doufáš, že tu najdeš?
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_07_01"); //Slávu a zlato. Co víc? Až se vypoâádám s têmi draky, budu se topit v penêzích.
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_07_02"); //A doufám, že budu mít dost na to, abych si mohl do konce života užívat po všech hospodách a nevêstincích v zemi.

	Info_AddChoice	(DIA_Biff_WASHIERIMTAL, "Fajn, tak ti pâeju hodnê štêstí.", DIA_Biff_WASHIERIMTAL_vielglueck );
	Info_AddChoice	(DIA_Biff_WASHIERIMTAL, "Buë tak, nebo budeš mrtvej!", DIA_Biff_WASHIERIMTAL_ihrtot );

};
func void DIA_Biff_WASHIERIMTAL_ihrtot ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_ihrtot_15_00"); //Buë tak, nebo budeš mrtvej!
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_ihrtot_07_01"); //A co? To k tomu patâí. Když chceš bejt bohatej, musíš trochu riskovat.

	Info_ClearChoices	(DIA_Biff_WASHIERIMTAL);
};

func void DIA_Biff_WASHIERIMTAL_vielglueck ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_vielglueck_15_00"); //Fajn, tak ti pâeju hodnê štêstí.
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_vielglueck_07_01"); //Nepotâebuju žádný štêstí. Staèí mi moje sekera.

	Info_ClearChoices	(DIA_Biff_WASHIERIMTAL);
};

///////////////////////////////////////////////////////////////////////
//	Info arbeiten
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_ARBEITEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	8;
	condition	 = 	DIA_Biff_ARBEITEN_Condition;
	information	 = 	DIA_Biff_ARBEITEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jak by se ti líbilo pracovat pro mê?";
};

func int DIA_Biff_ARBEITEN_Condition ()
{
	if 	(DJG_BiffParty == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Biff_HALLO))
		&& (DJG_Biff_Stay == FALSE)	
			{
					return TRUE;
			};
};
func void DIA_Biff_ARBEITEN_Info ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_15_00"); //Jak by se ti líbilo pracovat pro mê?
	
	B_LogEntry (TOPIC_Dragonhunter,"Drakobijec Biff je žoldnéâ têlem i duší. Když mu zaplatím, bude bojovat po mém boku."); 

	if (DJG_BiffParty_nomore >= 6) //Joly: Biff hat bei 3 die Schnauze voll vom SC
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_07_01"); //Už jsme to jednou zkusili. Moc to nefungovalo. Díky, nemám zájem.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_07_02"); //Mmh. Proè ne? Co z toho budu mít?
	};
	Info_ClearChoices	(DIA_Biff_ARBEITEN);
	
	Info_AddChoice	(DIA_Biff_ARBEITEN, "Budeš rád, když tê nechám naživu.", DIA_Biff_ARBEITEN_lebenlassen );
	Info_AddChoice	(DIA_Biff_ARBEITEN, "Dám ti pùlku koâisti.", DIA_Biff_ARBEITEN_HalbeHalbe );
	Info_AddChoice	(DIA_Biff_ARBEITEN, "Dám ti 100 zlatých.", DIA_Biff_ARBEITEN_100 );
};

func void DIA_Biff_ARBEITEN_100 ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_100_15_00"); //Dám ti 100 zlatých.

	if (B_GiveInvItems (other, self, ItMi_Gold,100))
		{	
			AI_Output			(self, other, "DIA_Biff_ARBEITEN_100_07_01"); //Tak dobrá. Mimochodem, to je jen pro zaèátek. Jdeme. Pùjdu za tebou.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"Follow");
			B_Biff_SetRefuseTalk ();
			self.aivar[AIV_PARTYMEMBER] = TRUE;
			DJG_BiffParty = TRUE;	
		}
		else
		{
			B_BIFF_VERARSCHEN ();
			AI_StopProcessInfos (self);
			DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
		};

};

func void DIA_Biff_ARBEITEN_HalbeHalbe ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_HalbeHalbe_15_00"); //Dám ti pùlku koâisti.
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_01"); //To zní dobâe. Ale varuju tê, nepokoušej se mê podvést, jinak toho budeš litovat.
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_02"); //A ještê jedna vêc, nezajímají mê žádné zbranê ani další krámy, co tady najdeš. Chci jen zlato, jasný?

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_BiffParty = TRUE;
	DJG_Biff_HalbeHalbe  = TRUE;
	B_Biff_SetRefuseTalk ();

	if (DJG_Biff_HalbeHalbe_again == FALSE)
	{
		DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
		DJG_Biff_HalbeHalbe_again = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_03"); //Ale co to âíkám. Tohle všechno už víš.
	};
};

func void DIA_Biff_ARBEITEN_lebenlassen ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_lebenlassen_15_00"); //Budeš rád, když tê nechám naživu.
	B_BIFF_VERARSCHEN ();
	AI_StopProcessInfos (self);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};


///////////////////////////////////////////////////////////////////////
//	Info Geldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_GELDEINTREIBEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 9;
	condition	 = 	DIA_Biff_GELDEINTREIBEN_Condition;
	information	 = 	DIA_Biff_GELDEINTREIBEN_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
var int BIFF_LABERT_GELDEINTREIBEN;
func int DIA_Biff_GELDEINTREIBEN_Condition ()
{
	if (DJG_Biff_SCGold < Npc_HasItems(hero,ItMi_Gold)-1)
		&& ((Npc_GetBodyState(hero))!= BS_INVENTORY)				//Joly: wegen Truhen		 
		&& ((Npc_GetBodyState(hero))!= BS_MOBINTERACT_INTERRUPT)
		&& (((Npc_GetBodyState(hero))!= BS_STAND)||(BIFF_LABERT_GELDEINTREIBEN == TRUE))//Joly: wegen Plündern von NSC-Invs	
		&& (((Npc_GetBodyState(hero))!= BS_ITEMINTERACT)||(BIFF_LABERT_GELDEINTREIBEN == TRUE))//Joly: wegen Geldbeutel	
		&& (DJG_Biff_HalbeHalbe == TRUE)
		&& (DJG_BiffParty == TRUE)	
		&& (DJG_Biff_Stay == FALSE)	
		{
			BIFF_LABERT_GELDEINTREIBEN = TRUE;
			return TRUE; 
		};
};

func void DIA_Biff_GELDEINTREIBEN_Info ()
{
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_07_00"); //Poèkej chvilku! Neâíkals, že pùlka koâisti patâí mnê? Dej to sem!

	B_BiffsAnteil_Berechnung ();
	B_BiffsAnteil_PrintScreen ();

	Info_ClearChoices	(DIA_Biff_GELDEINTREIBEN);

	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "To si nemùžu dovolit.", DIA_Biff_GELDEINTREIBEN_zuTeuer );
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Tady je tvùj podíl.", DIA_Biff_GELDEINTREIBEN_geben );
};
func void DIA_Biff_GELDEINTREIBEN_geben ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_geben_15_00"); //Tady je tvùj podíl.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_geben_07_01"); //Dobrá. Tak jdeme.
	AI_StopProcessInfos (self);
	B_GiveInvItems (other, self, ItMi_Gold, BiffsAnteil);
	B_Biff_SetRefuseTalk ();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00"); //To si nemùžu dovolit.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01"); //Pâestaà do mê huèet. Dohodli jsme se na polovinê.

	Info_ClearChoices	(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Teë se musíme rozdêlit, je mi líto.", DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen );
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Tady je tvùj podíl.", DIA_Biff_GELDEINTREIBEN_geben );

};
func void DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00"); //Teë se musíme rozdêlit, je mi líto.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01"); //Když to âíkáš. Tak to si prostê vezmu svùj podíl.

	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Zaèít");
	B_Attack (self, other, AR_NONE, 1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);	
};

///////////////////////////////////////////////////////////////////////
//	Info IchBleibhier
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_ICHBLEIBHIER		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 6;
	condition	 = 	DIA_Biff_ICHBLEIBHIER_Condition;
	information	 = 	DIA_Biff_ICHBLEIBHIER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_ICHBLEIBHIER_Condition ()
{
	if 		(
				((Npc_GetBodyState(hero))!= BS_INVENTORY)				//Joly: wegen Truhen
				&& ((Npc_GetBodyState(hero))!= BS_MOBINTERACT_INTERRUPT)
				&& (DJG_BiffParty == TRUE)
				&& (DJG_Biff_Stay == FALSE)	
				&& 	(
						(
							(
								//Joly: Biff stört nicht das Drachengespräch!
								((Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01")<4000)	&& (Npc_IsDead(SwampDragon)== FALSE)&& (SwampDragon.flags != 0))
								||((Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8")<2000)	&& (Npc_IsDead(RockDragon)== FALSE) && (RockDragon.flags != 0))
								||((Npc_GetDistToWP(self,"CASTLE_36")<4000)			&& (Npc_IsDead(FireDragon)== FALSE) && (FireDragon.flags != 0))
								||((Npc_GetDistToWP(self,"OW_ICEDRAGON_01")<4000)	&& (Npc_IsDead(IceDragon)== FALSE) 	&& (IceDragon.flags != 0))
							) 	
							&& (Npc_HasItems (hero,ItMi_InnosEye_Mis)>=1)
						)
						||(Npc_GetDistToWP(self,"OC_CENTER_GUARD_02")<4500)//Joly: Biff kommt nicht in die Burg
					)
			)
				{
					return TRUE;
				};
};

func void DIA_Biff_ICHBLEIBHIER_Info ()
{
	AI_Output			(self, other, "DIA_Biff_ICHBLEIBHIER_07_00"); //Tohle je vážnê nebezpeèná oblast. Bêž dopâedu. Budu ti krejt záda.

	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,300);

	if (Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Swamp");
	};

	if (Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Rock");
	};

	if (Npc_GetDistToWP(self,"CASTLE_36")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Fire");
	};

	if (Npc_GetDistToWP(self,"OW_ICEDRAGON_01")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Ice");
	};

	if (Npc_GetDistToWP(self,"OC_CENTER_GUARD_02")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_AwayFromOC");
	};
	DJG_Biff_Stay = TRUE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info Stay_AwayFromOC
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_Stay_AwayFromOC		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	condition	 = 	DIA_Biff_Stay_AwayFromOC_Condition;
	information	 = 	DIA_Biff_Stay_AwayFromOC_Info;
	nr		 	 = 3;
	permanent	 = 	TRUE;

	description	 = 	"(Opêt vzít Biffa s sebou.)";

};

func int DIA_Biff_Stay_AwayFromOC_Condition ()
{
		if 	(
				(Npc_GetDistToWP(self,"OW_PATH_298")<500)
				||(Npc_GetDistToWP(self,"LOCATION_19_01")<500)
			)
			&& (DJG_BiffParty == TRUE)	
			&& (DJG_Biff_Stay == TRUE)	
				{
					return TRUE;
				};
};

func void DIA_Biff_Stay_AwayFromOC_Info ()
{
	B_KommMit ();
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Follow");
	DJG_Biff_Stay = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info Kohleweggeben
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_KOHLEWEGGEBEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	condition	 = 	DIA_Biff_KOHLEWEGGEBEN_Condition;
	information	 = 	DIA_Biff_KOHLEWEGGEBEN_Info;
	nr		 	 = 10;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_KOHLEWEGGEBEN_Condition ()
{
	if (DJG_Biff_SCGold > Npc_HasItems(hero,ItMi_Gold))
		&& (DJG_Biff_HalbeHalbe == TRUE)
		&& (DJG_BiffParty == TRUE)	
		&& (DJG_Biff_Stay == FALSE)	
		{
			//Joly:return TRUE;
		};
};

func void DIA_Biff_KOHLEWEGGEBEN_Info ()
{
	AI_Output			(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_00"); //Nerozházej to všechno najednou
	AI_Output			(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_01"); //Tak to bude lepší, když ho dáš mnê.

	AI_StopProcessInfos (self);
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};


///////////////////////////////////////////////////////////////////////
//	Info BiffLosWerden
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_BIFFLOSWERDEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 11;
	condition	 = 	DIA_Biff_BIFFLOSWERDEN_Condition;
	information	 = 	DIA_Biff_BIFFLOSWERDEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mám dojem, že tady by naše spolupráce mêla skonèit.";
};

func int DIA_Biff_BIFFLOSWERDEN_Condition ()
{
	if (DJG_BiffParty == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Biff_BIFFLOSWERDEN_Info ()
{
	AI_Output			(other, self, "DIA_Biff_BIFFLOSWERDEN_15_00"); //Mám dojem, že tady by naše spolupráce mêla skonèit.
	AI_Output			(self, other, "DIA_Biff_BIFFLOSWERDEN_07_01"); //Jak je libo. Taky bych mêl zaèít myslet na lepší vêci. Tak zatím.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Zaèít");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 1);
};

///////////////////////////////////////////////////////////////////////
//	Info MehrGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_MEHRGELD		(C_INFO)
{
	npc		 	= 	DJG_713_Biff;
	nr			 = 12;
	condition	 = 	DIA_Biff_MEHRGELD_Condition;
	information	 = 	DIA_Biff_MEHRGELD_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_MEHRGELD_Condition ()
{
	if 	(DJG_BiffParty == TRUE)
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (DJG_Biff_Stay == FALSE)	
		{
				return TRUE;
		};
};
var int DIA_Biff_MEHRGELD_Info_OneTime;
func void DIA_Biff_MEHRGELD_Info ()
{
	AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_00"); //Zaèínám mít dojem, že bych z tebe mohl dostat víc penêz.

	if (DJG_Biff_HalbeHalbe == TRUE)
	{
		AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_01"); //100 zlatých by to mêlo spravit.
		if (DIA_Biff_MEHRGELD_Info_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_02"); //Žádnej problém. Jasnê že jsem nezapomnêl, že si máme rozdêlit koâist.
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_03"); //Proto jsem tê taky tak èasto otravoval, abys mi dal víc penêz.
			DIA_Biff_MEHRGELD_Info_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_04"); //Chci dalších 100 zlatých.
	};
	
	Info_ClearChoices	(DIA_Biff_MEHRGELD);
	
	Info_AddChoice	(DIA_Biff_MEHRGELD, "To si nemùžu dovolit.", DIA_Biff_MEHRGELD_zuTeuer );
	Info_AddChoice	(DIA_Biff_MEHRGELD, "Dobrá. Za to mi ještê stojíš.", DIA_Biff_MEHRGELD_ok );

};

func void DIA_Biff_MEHRGELD_ok ()
{
	AI_Output			(other, self, "DIA_Biff_MEHRGELD_ok_15_00"); //Dobrá. Za to mi ještê stojíš.

	if (B_GiveInvItems (other, self, ItMi_Gold,100))
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_01"); //Dá se to tak âíct. Tak jdeme.

			AI_StopProcessInfos (self);

			if (DJG_Biff_HalbeHalbe == TRUE)
			{
				DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
			};
			B_Biff_SetRefuseTalk ();
		}
		else
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_02"); //Ty mizernej bâídile, nemùžeš ani zaplatit poâádnýho ozbrojence.
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_03"); //Mám dojem, že si najdu jinýho obchodního partnera.
			
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"Zaèít");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			DJG_Biff_HalbeHalbe = FALSE;
			DJG_BiffParty = FALSE;
			DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 2);
		};
};

func void DIA_Biff_MEHRGELD_zuTeuer ()
{
	AI_Output			(other, self, "DIA_Biff_MEHRGELD_zuTeuer_15_00"); //To si nemùžu dovolit.
	AI_Output			(self, other, "DIA_Biff_MEHRGELD_zuTeuer_07_01"); //Tak to si teëka dál šlapej sám.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Zaèít");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 2);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_HEILUNG		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	4;
	condition	 = 	DIA_Biff_HEILUNG_Condition;
	information	 = 	DIA_Biff_HEILUNG_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nepotâebuješ nêjaký léèivý lektvar?";
};

func int DIA_Biff_HEILUNG_Condition ()
{
	if (DJG_BiffParty == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Biff_HEILUNG_Info ()
{
	AI_Output			(other, self, "DIA_Biff_HEILUNG_15_00"); //Nepotâebuješ nêjaký léèivý lektvar?
	AI_Output			(self, other, "DIA_Biff_HEILUNG_07_01"); //Jasnê. To nemùže bejt na škodu.

	Info_ClearChoices	(DIA_Biff_HEILUNG);
	Info_AddChoice	(DIA_Biff_HEILUNG, "Dám ti nêjaký pozdêji.", DIA_Biff_HEILUNG_spaeter );
	Info_AddChoice	(DIA_Biff_HEILUNG, "(Nejmenší léèivý lektvar.)", DIA_Biff_HEILUNG_heiltrankLow );
	Info_AddChoice	(DIA_Biff_HEILUNG, "(Nejlepší léèivý lektvar.)", DIA_Biff_HEILUNG_heiltrank );

};
func void DIA_Biff_HEILUNG_heiltrank ()
{
	if (B_GiveInvItems (other, self, ItPo_Health_03,1))
	{
	B_UseItem (self, ItPo_Health_03);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_02,1))
	{
	B_UseItem (self, ItPo_Health_02);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_01,1))
	{
	B_UseItem (self, ItPo_Health_01);
	}
	else
	{
	AI_Output			(self, other, "DIA_Biff_HEILUNG_heiltrank_07_00"); //Hádám, že si budu muset poèkat, dokud pro mê nêjaký nebudeš mít.
	};

	AI_StopProcessInfos (self);
};
func void DIA_Biff_HEILUNG_heiltrankLow ()
{
	if (B_GiveInvItems (other, self, ItPo_Health_01,1))
	{
	B_UseItem (self, ItPo_Health_01);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_02,1))
	{
	B_UseItem (self, ItPo_Health_02);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_03,1))
	{
	B_UseItem (self, ItPo_Health_03);
	}
	else
	{
	AI_Output			(self, other, "DIA_Biff_HEILUNG_heiltrankLow_07_00"); //Bohužel, žádný zrovna nemáš. Ještê se tu pozdêji pro nêjaký zastavím.
	};

	AI_StopProcessInfos (self);
};
func void DIA_Biff_HEILUNG_spaeter ()
{
	AI_Output			(other, self, "DIA_Biff_HEILUNG_spaeter_15_00"); //Dám ti nêjaký pozdêji.
	AI_Output			(self ,other, "DIA_Biff_HEILUNG_spaeter_07_01"); //Ale nezapomeà.
	
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DRACHENTOT		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	5;
	condition	 = 	DIA_Biff_DRACHENTOT_Condition;
	information	 = 	DIA_Biff_DRACHENTOT_Info;

	description	 = 	"Tak, a je to. Všichni draci jsou mrtví.";
};

func int DIA_Biff_DRACHENTOT_Condition ()
{
	if (DJG_BiffSurvivedLastDragon == TRUE) 
		{
				return TRUE;
		};
};

func void DIA_Biff_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Biff_DRACHENTOT_15_00"); //Tak, a je to. Všichni draci jsou mrtví.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_01"); //Jo. A já jsem poâád tady.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_02"); //Jseš si jistej, že tohle byl poslední?
	AI_Output			(other, self, "DIA_Biff_DRACHENTOT_15_03"); //Myslím, že jo.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_04"); //To je špatný. Právê jsem se rozehâál.
	B_GivePlayerXP (XP_BiffSurvivedLastDragon);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	DJG_713_Biff;
	nr			 = 	2;
	condition	 = 	DIA_Biff_KnowWhereEnemy_Condition;
	information	 = 	DIA_Biff_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Nemêl bys chuã na menší výlet kolem svêta?";
};
func int DIA_Biff_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Biff_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Biff_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Biff_KnowWhereEnemy_15_00"); //Nemêl bys chuã na menší výlet kolem svêta?
	AI_Output			(self, other, "DIA_Biff_KnowWhereEnemy_07_01"); //Co?
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Biff_KnowWhereEnemy_15_02"); //Zapomeà na to. Stejnê už mám plnou loë.
		AI_Output			(self, other, "DIA_Biff_KnowWhereEnemy_07_03"); //Pâestaà si ze mê utahovat, chlape.
	}
	else 
	{
		AI_Output			(other,self , "DIA_Biff_KnowWhereEnemy_15_04"); //Chystám se opustit Khorinis a vyrazit na ostrov, abych se tam poohlédl po nêjakých nových protivnících.

		Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
		Info_AddChoice (DIA_Biff_KnowWhereEnemy,"Prostê jsem si myslel, že bych se o tom mêl zmínit.",DIA_Biff_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Biff_KnowWhereEnemy,"Nechceš jít taky?",DIA_Biff_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Biff_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_00"); //Nechceš jít taky?
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01"); //Další nepâátelé mê neberou. Chci...
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_02"); //Tam, kam jedeme, bude víc zlata, než uneseš.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03"); //Když je to tak, tak to jsem pro. Kam jedeme?
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_04"); //Ale nejdâív tê musíme dostat pryè z Hornického údolí.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05"); //Žádný problém. Dostanu se odsud. Potkáme se v prùsmyku.

	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                       
    Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                       
    B_LogEntry (TOPIC_Crew,"Biff se ke mnê pâi vidinê nesmírného bohatství pâidal. Pokud mu poskytnu dost zlata, mohu s ním poèítat."); 
    
    B_GivePlayerXP (XP_Crewmember_Success);   

	self.flags 		 = NPC_FLAG_IMMORTAL;
	Biff_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	Biff_FollowsThroughPass = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"RunsToPass"); 

	Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
};

FUNC VOID DIA_Biff_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_No_15_00"); //Prostê jsem si myslel, že bych se o tom mêl zmínit.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_No_07_01"); //Dobrá, dobrá, tak hodnê štêstí.

	Biff_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	Gleich geht´s los
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_Pass		(C_INFO)
{
	npc			 = 	DJG_713_Biff;
	nr			 = 	55;
	condition	 = 	DIA_Biff_Pass_Condition;
	information	 = 	DIA_Biff_Pass_Info;
	PERMANENT 	 =  TRUE;

	description	 = 	"Dostaneš se pâes prùsmyk?";
};
func int DIA_Biff_Pass_Condition ()
{	
	if (Npc_GetDistToWP(self,"START")<1000)
	&& (Biff_IsOnBoard == LOG_SUCCESS) 
		{
				return TRUE;
		};
};
func void DIA_Biff_Pass_Info ()
{
	AI_Output			(other, self, "DIA_Biff_Pass_15_00"); //Dostaneš se pâes prùsmyk?
	AI_Output			(self, other, "DIA_Biff_Pass_07_01"); //Pâestaà žvanit. Pokraèuj. Chci už to koneènê mít za sebou.
	AI_StopProcessInfos (self);

};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Biff_PICKPOCKET (C_INFO)
{
	npc			= DJG_713_Biff;
	nr			= 900;
	condition	= DIA_Biff_PICKPOCKET_Condition;
	information	= DIA_Biff_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Biff_PICKPOCKET_Condition()
{
	C_Beklauen (92, 320);
};
 
FUNC VOID DIA_Biff_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Biff_PICKPOCKET);
	Info_AddChoice		(DIA_Biff_PICKPOCKET, DIALOG_BACK 		,DIA_Biff_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Biff_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Biff_PICKPOCKET_DoIt);
};

func void DIA_Biff_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Biff_PICKPOCKET);
};
	
func void DIA_Biff_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Biff_PICKPOCKET);
};

































