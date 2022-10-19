func void B_KommMit ()
{
	AI_Output (other, self,"DIA_AkilsSchaf_KommMit_15_00");	//Poj� za mnou!
};
func void B_BIFF_VERARSCHEN ()
{
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_lebenlassen_07_01"); //Nem�m zapot�eb�, aby si ze m� n�kdo d�lal bl�zny.
};

func void B_BiffsAnteil_Berechnung() //Joly: Wieviel Kohle mu� der SC Biff nun geben:
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
func void B_Biff_SetRefuseTalk ()	//Joly: Biffs Geld eintreiberei kommt beim HalbeHalbe Deal nicht so h�ufig.
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

	description	 = 	"Co tady d�l�?";
};

func int DIA_Biff_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Biff_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_15_00"); //Co tady d�l�?
	AI_Output			(self, other, "DIA_Biff_HALLO_07_01"); //To je ta nejblb�j�� ot�zka, jakou jsem kdy sly�el. Co asi tak mysl�?

	Info_AddChoice	(DIA_Biff_HALLO, "Z tak p�iblbl�ho v�razu, jakej m� ty, se ned� nic poznat.", DIA_Biff_HALLO_spott );
	Info_AddChoice	(DIA_Biff_HALLO, "Nem�m tucha.", DIA_Biff_HALLO_keineAhnung );
	Info_AddChoice	(DIA_Biff_HALLO, "To nic.", DIA_Biff_HALLO_doof );
};

func void DIA_Biff_HALLO_doof ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_doof_15_00"); //To nic.
	Info_ClearChoices	(DIA_Biff_HALLO);
};

func void DIA_Biff_HALLO_spott ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_spott_15_00"); //Z tak p�iblbl�ho v�razu, jakej m� ty, se ned� nic poznat. Proto jsem se taky musel zeptat.
	AI_Output			(self, other, "DIA_Biff_HALLO_spott_07_01"); //Na m�j vkus m� n�jak moc velkou hubu. Je na�ase, aby ti ji n�kdo zav�el.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};

func void DIA_Biff_HALLO_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_15_00"); //Tak o tom nem�m ani tucha.
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_07_01"); //�ek�m, co se tu nakonec semele.

	Info_AddChoice	(DIA_Biff_HALLO, "Co �ek�, �e se stane?", DIA_Biff_HALLO_keineAhnung_was );
};
func void DIA_Biff_HALLO_keineAhnung_was ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_15_00"); //Co �ek�, �e se stane?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_07_01"); //Hele chlape, ty sis v�n� nebyl dvakr�t, kdy� Innos rozd�val rozum. Kdybych to v�d�l, na nic bych ne�ekal.

	Info_AddChoice	(DIA_Biff_HALLO, "Tak co se chyst�?", DIA_Biff_HALLO_keineAhnung_was_was2 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_15_00"); //Tak co se chyst�?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_07_01"); //U� mi leze� na nervy. Hele, nestar�m se o to, co se stane. A� do t� chv�le, kdy se to stane.

	Info_AddChoice	(DIA_Biff_HALLO, "Tak pro� n�co ned�l�?", DIA_Biff_HALLO_keineAhnung_was_was2_was3 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2_was3 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00"); //Tak pro� n�co ned�l�?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01"); //Jestli mi okam�it� nep�estane� d�vat ty p�iblbl� ot�zky, tak ti tu tvoj� nevym�chanou hubu rychle zav�u.


	Info_AddChoice	(DIA_Biff_HALLO, "Kdy� tu bude� jen tak �ekat, nikdy se nic nestane!", DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00"); //Kdy� tu bude� jen tak �ekat, nikdy se nic nestane!
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

	description	 = 	"Co douf�, �e tu najde�?";
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
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_15_00"); //Co douf�, �e tu najde�?
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_07_01"); //Sl�vu a zlato. Co v�c? A� se vypo��d�m s t�mi draky, budu se topit v pen�z�ch.
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_07_02"); //A douf�m, �e budu m�t dost na to, abych si mohl do konce �ivota u��vat po v�ech hospod�ch a nev�stinc�ch v zemi.

	Info_AddChoice	(DIA_Biff_WASHIERIMTAL, "Fajn, tak ti p�eju hodn� �t�st�.", DIA_Biff_WASHIERIMTAL_vielglueck );
	Info_AddChoice	(DIA_Biff_WASHIERIMTAL, "Bu� tak, nebo bude� mrtvej!", DIA_Biff_WASHIERIMTAL_ihrtot );

};
func void DIA_Biff_WASHIERIMTAL_ihrtot ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_ihrtot_15_00"); //Bu� tak, nebo bude� mrtvej!
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_ihrtot_07_01"); //A co? To k tomu pat��. Kdy� chce� bejt bohatej, mus� trochu riskovat.

	Info_ClearChoices	(DIA_Biff_WASHIERIMTAL);
};

func void DIA_Biff_WASHIERIMTAL_vielglueck ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_vielglueck_15_00"); //Fajn, tak ti p�eju hodn� �t�st�.
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_vielglueck_07_01"); //Nepot�ebuju ��dn� �t�st�. Sta�� mi moje sekera.

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

	description	 = 	"Jak by se ti l�bilo pracovat pro m�?";
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
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_15_00"); //Jak by se ti l�bilo pracovat pro m�?
	
	B_LogEntry (TOPIC_Dragonhunter,"Drakobijec Biff je �oldn�� t�lem i du��. Kdy� mu zaplat�m, bude bojovat po m�m boku."); 

	if (DJG_BiffParty_nomore >= 6) //Joly: Biff hat bei 3 die Schnauze voll vom SC
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_07_01"); //U� jsme to jednou zkusili. Moc to nefungovalo. D�ky, nem�m z�jem.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_07_02"); //Mmh. Pro� ne? Co z toho budu m�t?
	};
	Info_ClearChoices	(DIA_Biff_ARBEITEN);
	
	Info_AddChoice	(DIA_Biff_ARBEITEN, "Bude� r�d, kdy� t� nech�m na�ivu.", DIA_Biff_ARBEITEN_lebenlassen );
	Info_AddChoice	(DIA_Biff_ARBEITEN, "D�m ti p�lku ko�isti.", DIA_Biff_ARBEITEN_HalbeHalbe );
	Info_AddChoice	(DIA_Biff_ARBEITEN, "D�m ti 100 zlat�ch.", DIA_Biff_ARBEITEN_100 );
};

func void DIA_Biff_ARBEITEN_100 ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_100_15_00"); //D�m ti 100 zlat�ch.

	if (B_GiveInvItems (other, self, ItMi_Gold,100))
		{	
			AI_Output			(self, other, "DIA_Biff_ARBEITEN_100_07_01"); //Tak dobr�. Mimochodem, to je jen pro za��tek. Jdeme. P�jdu za tebou.
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
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_HalbeHalbe_15_00"); //D�m ti p�lku ko�isti.
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_01"); //To zn� dob�e. Ale varuju t�, nepokou�ej se m� podv�st, jinak toho bude� litovat.
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_02"); //A je�t� jedna v�c, nezaj�maj� m� ��dn� zbran� ani dal�� kr�my, co tady najde�. Chci jen zlato, jasn�?

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
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_03"); //Ale co to ��k�m. Tohle v�echno u� v�.
	};
};

func void DIA_Biff_ARBEITEN_lebenlassen ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_lebenlassen_15_00"); //Bude� r�d, kdy� t� nech�m na�ivu.
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
		&& (((Npc_GetBodyState(hero))!= BS_STAND)||(BIFF_LABERT_GELDEINTREIBEN == TRUE))//Joly: wegen Pl�ndern von NSC-Invs	
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
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_07_00"); //Po�kej chvilku! Ne��kals, �e p�lka ko�isti pat�� mn�? Dej to sem!

	B_BiffsAnteil_Berechnung ();
	B_BiffsAnteil_PrintScreen ();

	Info_ClearChoices	(DIA_Biff_GELDEINTREIBEN);

	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "To si nem��u dovolit.", DIA_Biff_GELDEINTREIBEN_zuTeuer );
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Tady je tv�j pod�l.", DIA_Biff_GELDEINTREIBEN_geben );
};
func void DIA_Biff_GELDEINTREIBEN_geben ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_geben_15_00"); //Tady je tv�j pod�l.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_geben_07_01"); //Dobr�. Tak jdeme.
	AI_StopProcessInfos (self);
	B_GiveInvItems (other, self, ItMi_Gold, BiffsAnteil);
	B_Biff_SetRefuseTalk ();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00"); //To si nem��u dovolit.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01"); //P�esta� do m� hu�et. Dohodli jsme se na polovin�.

	Info_ClearChoices	(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Te� se mus�me rozd�lit, je mi l�to.", DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen );
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Tady je tv�j pod�l.", DIA_Biff_GELDEINTREIBEN_geben );

};
func void DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00"); //Te� se mus�me rozd�lit, je mi l�to.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01"); //Kdy� to ��k�. Tak to si prost� vezmu sv�j pod�l.

	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Za��t");
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
								//Joly: Biff st�rt nicht das Drachengespr�ch!
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
	AI_Output			(self, other, "DIA_Biff_ICHBLEIBHIER_07_00"); //Tohle je v�n� nebezpe�n� oblast. B� dop�edu. Budu ti krejt z�da.

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

	description	 = 	"(Op�t vz�t Biffa s sebou.)";

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
	AI_Output			(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_00"); //Nerozh�zej to v�echno najednou
	AI_Output			(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_01"); //Tak to bude lep��, kdy� ho d� mn�.

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

	description	 = 	"M�m dojem, �e tady by na�e spolupr�ce m�la skon�it.";
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
	AI_Output			(other, self, "DIA_Biff_BIFFLOSWERDEN_15_00"); //M�m dojem, �e tady by na�e spolupr�ce m�la skon�it.
	AI_Output			(self, other, "DIA_Biff_BIFFLOSWERDEN_07_01"); //Jak je libo. Taky bych m�l za��t myslet na lep�� v�ci. Tak zat�m.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Za��t");
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
	AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_00"); //Za��n�m m�t dojem, �e bych z tebe mohl dostat v�c pen�z.

	if (DJG_Biff_HalbeHalbe == TRUE)
	{
		AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_01"); //100 zlat�ch by to m�lo spravit.
		if (DIA_Biff_MEHRGELD_Info_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_02"); //��dnej probl�m. Jasn� �e jsem nezapomn�l, �e si m�me rozd�lit ko�ist.
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_03"); //Proto jsem t� taky tak �asto otravoval, abys mi dal v�c pen�z.
			DIA_Biff_MEHRGELD_Info_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_04"); //Chci dal��ch 100 zlat�ch.
	};
	
	Info_ClearChoices	(DIA_Biff_MEHRGELD);
	
	Info_AddChoice	(DIA_Biff_MEHRGELD, "To si nem��u dovolit.", DIA_Biff_MEHRGELD_zuTeuer );
	Info_AddChoice	(DIA_Biff_MEHRGELD, "Dobr�. Za to mi je�t� stoj�.", DIA_Biff_MEHRGELD_ok );

};

func void DIA_Biff_MEHRGELD_ok ()
{
	AI_Output			(other, self, "DIA_Biff_MEHRGELD_ok_15_00"); //Dobr�. Za to mi je�t� stoj�.

	if (B_GiveInvItems (other, self, ItMi_Gold,100))
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_01"); //D� se to tak ��ct. Tak jdeme.

			AI_StopProcessInfos (self);

			if (DJG_Biff_HalbeHalbe == TRUE)
			{
				DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
			};
			B_Biff_SetRefuseTalk ();
		}
		else
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_02"); //Ty mizernej b��dile, nem��e� ani zaplatit po��dn�ho ozbrojence.
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_03"); //M�m dojem, �e si najdu jin�ho obchodn�ho partnera.
			
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"Za��t");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			DJG_Biff_HalbeHalbe = FALSE;
			DJG_BiffParty = FALSE;
			DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 2);
		};
};

func void DIA_Biff_MEHRGELD_zuTeuer ()
{
	AI_Output			(other, self, "DIA_Biff_MEHRGELD_zuTeuer_15_00"); //To si nem��u dovolit.
	AI_Output			(self, other, "DIA_Biff_MEHRGELD_zuTeuer_07_01"); //Tak to si te�ka d�l �lapej s�m.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Za��t");
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

	description	 = 	"Nepot�ebuje� n�jak� l��iv� lektvar?";
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
	AI_Output			(other, self, "DIA_Biff_HEILUNG_15_00"); //Nepot�ebuje� n�jak� l��iv� lektvar?
	AI_Output			(self, other, "DIA_Biff_HEILUNG_07_01"); //Jasn�. To nem��e bejt na �kodu.

	Info_ClearChoices	(DIA_Biff_HEILUNG);
	Info_AddChoice	(DIA_Biff_HEILUNG, "D�m ti n�jak� pozd�ji.", DIA_Biff_HEILUNG_spaeter );
	Info_AddChoice	(DIA_Biff_HEILUNG, "(Nejmen�� l��iv� lektvar.)", DIA_Biff_HEILUNG_heiltrankLow );
	Info_AddChoice	(DIA_Biff_HEILUNG, "(Nejlep�� l��iv� lektvar.)", DIA_Biff_HEILUNG_heiltrank );

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
	AI_Output			(self, other, "DIA_Biff_HEILUNG_heiltrank_07_00"); //H�d�m, �e si budu muset po�kat, dokud pro m� n�jak� nebude� m�t.
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
	AI_Output			(self, other, "DIA_Biff_HEILUNG_heiltrankLow_07_00"); //Bohu�el, ��dn� zrovna nem�. Je�t� se tu pozd�ji pro n�jak� zastav�m.
	};

	AI_StopProcessInfos (self);
};
func void DIA_Biff_HEILUNG_spaeter ()
{
	AI_Output			(other, self, "DIA_Biff_HEILUNG_spaeter_15_00"); //D�m ti n�jak� pozd�ji.
	AI_Output			(self ,other, "DIA_Biff_HEILUNG_spaeter_07_01"); //Ale nezapome�.
	
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

	description	 = 	"Tak, a je to. V�ichni draci jsou mrtv�.";
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
	AI_Output			(other, self, "DIA_Biff_DRACHENTOT_15_00"); //Tak, a je to. V�ichni draci jsou mrtv�.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_01"); //Jo. A j� jsem po��d tady.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_02"); //Jse� si jistej, �e tohle byl posledn�?
	AI_Output			(other, self, "DIA_Biff_DRACHENTOT_15_03"); //Mysl�m, �e jo.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_04"); //To je �patn�. Pr�v� jsem se rozeh��l.
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
	description	 = 	"Nem�l bys chu� na men�� v�let kolem sv�ta?";
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
	AI_Output			(other, self, "DIA_Biff_KnowWhereEnemy_15_00"); //Nem�l bys chu� na men�� v�let kolem sv�ta?
	AI_Output			(self, other, "DIA_Biff_KnowWhereEnemy_07_01"); //Co?
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Biff_KnowWhereEnemy_15_02"); //Zapome� na to. Stejn� u� m�m plnou lo�.
		AI_Output			(self, other, "DIA_Biff_KnowWhereEnemy_07_03"); //P�esta� si ze m� utahovat, chlape.
	}
	else 
	{
		AI_Output			(other,self , "DIA_Biff_KnowWhereEnemy_15_04"); //Chyst�m se opustit Khorinis a vyrazit na ostrov, abych se tam poohl�dl po n�jak�ch nov�ch protivn�c�ch.

		Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
		Info_AddChoice (DIA_Biff_KnowWhereEnemy,"Prost� jsem si myslel, �e bych se o tom m�l zm�nit.",DIA_Biff_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Biff_KnowWhereEnemy,"Nechce� j�t taky?",DIA_Biff_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Biff_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_00"); //Nechce� j�t taky?
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01"); //Dal�� nep��tel� m� neberou. Chci...
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_02"); //Tam, kam jedeme, bude v�c zlata, ne� unese�.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03"); //Kdy� je to tak, tak to jsem pro. Kam jedeme?
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_04"); //Ale nejd��v t� mus�me dostat pry� z Hornick�ho �dol�.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05"); //��dn� probl�m. Dostanu se odsud. Potk�me se v pr�smyku.

	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                       
    Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                       
    B_LogEntry (TOPIC_Crew,"Biff se ke mn� p�i vidin� nesm�rn�ho bohatstv� p�idal. Pokud mu poskytnu dost zlata, mohu s n�m po��tat."); 
    
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
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_No_15_00"); //Prost� jsem si myslel, �e bych se o tom m�l zm�nit.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_No_07_01"); //Dobr�, dobr�, tak hodn� �t�st�.

	Biff_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	Gleich geht�s los
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_Pass		(C_INFO)
{
	npc			 = 	DJG_713_Biff;
	nr			 = 	55;
	condition	 = 	DIA_Biff_Pass_Condition;
	information	 = 	DIA_Biff_Pass_Info;
	PERMANENT 	 =  TRUE;

	description	 = 	"Dostane� se p�es pr�smyk?";
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
	AI_Output			(other, self, "DIA_Biff_Pass_15_00"); //Dostane� se p�es pr�smyk?
	AI_Output			(self, other, "DIA_Biff_Pass_07_01"); //P�esta� �vanit. Pokra�uj. Chci u� to kone�n� m�t za sebou.
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

































