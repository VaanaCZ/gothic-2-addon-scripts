// ************************************************************
// 			  					EXIT 
// ************************************************************
INSTANCE DIA_Sekob_EXIT (C_INFO)
{
	npc         = BAU_930_Sekob;
	nr          = 999;
	condition   = DIA_Sekob_EXIT_Condition;
	information = DIA_Sekob_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sekob_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sekob_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 
// ************************************************************
// 			  					Hallo 
// ************************************************************
instance DIA_Sekob_HALLO (C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 3;
	condition	= DIA_Sekob_HALLO_Condition;
	information	= DIA_Sekob_HALLO_Info;
	permanent	= FALSE;
	important	= TRUE;
};

func int DIA_Sekob_HALLO_Condition ()
{
	if (Kapitel < 3)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Sekob_HALLO_01_00"); //Co dêláš na mém pozemku? Tady není nic, co bys mohl ukrást. Pakuj se.
	AI_Output (other, self, "DIA_Sekob_HALLO_15_01"); //Není v týhle zatracený zemi kousek pùdy, která by nikomu nepatâila?
	AI_Output (self, other, "DIA_Sekob_HALLO_01_02"); //Zaèni makat, pak ti možná jednoho dne bude taky nêjaká pùda patâit. Ale do té doby se poflakuj nêkde jinde.
};

// ************************************************************
// 			  					PermVorMis 
// ************************************************************
instance DIA_Sekob_PermVorMis (C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 3;
	condition	= DIA_Sekob_PermVorMis_Condition;
	information	= DIA_Sekob_PermVorMis_Info;
	permanent	= TRUE;
	description	= "Poslouchej...";
};

func int DIA_Sekob_PermVorMis_Condition ()
{
	if (Kapitel < 3)
	&& (MIS_Torlof_HolPachtVonSekob == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_PermVorMis_Info ()
{
	AI_Output (other, self, "DIA_Sekob_PermVorMis_15_00"); //Poslouchej...
	AI_Output (self, other, "DIA_Sekob_PermVorMis_01_01"); //Nemám pro tebe žádnou práci. A teë vypadni!
};

// ************************************************************
// 			  				ZAHL PACHT 
// ************************************************************
instance DIA_Sekob_ZAHLPACHT		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_ZAHLPACHT_Condition;
	information	= DIA_Sekob_ZAHLPACHT_Info;
	permanent	= FALSE;
	description	= "Onar chce, abys už koneènê zaplatil nájem.";
};

func int DIA_Sekob_ZAHLPACHT_Condition ()
{
	if (MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Sekob_ZAHLPACHT_Info ()
{
	AI_Output (other, self, "DIA_Sekob_ZAHLPACHT_15_00"); //Tahle pùda patâí velkostatkáâi a ty jsi tady jenom v nájmu. Onar chce, abys mu zaplatil rentu. Dlužíš už za nêkolik týdnù.
	AI_Output (self, other, "DIA_Sekob_ZAHLPACHT_01_01"); //Co? A to poslal takovýho nièemu? Pâece ti nebudu vêâit.
	AI_Output (self, other, "DIA_Sekob_ZAHLPACHT_01_02"); //Vypadni odsud, nebo se neudržím.
	
	self.aivar[AIV_DefeatedByPlayer] = FALSE; //WICHTIG
};

// ************************************************************
// 			  				Kohle Raus (not defeated)
// ************************************************************
instance DIA_Sekob_KohleRaus		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_KohleRaus_Condition;
	information	= DIA_Sekob_KohleRaus_Info;
	permanent	= TRUE;
	description	= "Naval prachy, nebo dostaneš do zubù.";
};

func int DIA_Sekob_KohleRaus_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Sekob_ZAHLPACHT))
	&& (self.aivar[AIV_DefeatedByPlayer] == FALSE) 
	{
		return TRUE;
	};
};

func void DIA_Sekob_KohleRaus_Info ()
{
	AI_Output (other, self, "DIA_Sekob_KohleRaus_15_00"); //Naval prachy, nebo dostaneš do zubù.
	AI_Output (self, other, "DIA_Sekob_KohleRaus_01_01"); //Ty se mi do šrajtofle nedostaneš, ty kriminálníku. TY NE!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);	
};

// ************************************************************
// 			  				InformOnar
// ************************************************************
instance DIA_Sekob_InformOnar		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_InformOnar_Condition;
	information	= DIA_Sekob_InformOnar_Info;
	permanent	= FALSE;
	description	= "Tak to mám dojem, že o tom povím Onarovi.";
};

func int DIA_Sekob_InformOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Sekob_ZAHLPACHT))
	&& (self.aivar[AIV_DefeatedByPlayer] == FALSE) 
	{
		return TRUE;
	};
};

func void DIA_Sekob_InformOnar_Info ()
{
	AI_Output (other, self, "DIA_Sekob_InformOnar_15_00"); //Tak to mám dojem, že o tom povím Onarovi.
	AI_Output (self, other, "DIA_Sekob_InformOnar_01_01"); //To je mi fuk! Mùžeš Onarovi âíct, že nic nemám. To je smutná pravda.
	MIS_Sekob_RedeMitOnar = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

	
// ************************************************************
// 			  				Defeated (Kohle Raus II)
// ************************************************************
instance DIA_Sekob_Defeated		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_Defeated_Condition;
	information	= DIA_Sekob_Defeated_Info;
	permanent	= FALSE;
	description	= "Kde jsou ty peníze!?!";
};

func int DIA_Sekob_Defeated_Condition ()
{
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE) 
	&& (Npc_KnowsInfo (other, DIA_Sekob_ZAHLPACHT))
	&& (Sekob_Pachtbezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_Defeated_Info ()
{
	AI_Output (other, self, "DIA_Sekob_Defeated_15_00"); //Kde jsou ty peníze!?!
	AI_Output (self, other, "DIA_Sekob_Defeated_01_01"); //Už mê nebij, prosím. Udêlám, co âekneš.
	AI_Output (other, self, "DIA_Sekob_Defeated_15_02"); //Tak zaplaã nájem.
	AI_Output (self, other, "DIA_Sekob_Defeated_01_03"); //(naâíkavê) Ale pane, já nic nemám. Jsem jen chudý ubožák, co skoro umírá hlady.
	AI_Output (self, other, "DIA_Sekob_Defeated_01_04"); //Moje úroda celá uschla. CHTÊL bych zaplatit, ale já prostê nemám èím. Smùla.

	Info_ClearChoices	(DIA_Sekob_Defeated);
	Info_AddChoice	(DIA_Sekob_Defeated, "Buë ten nájem zaplatíš hned teë, nebo tê zabiju.", DIA_Sekob_Defeated_hart);
	Info_AddChoice	(DIA_Sekob_Defeated, "Fajn, âeknu to Onarovi.", DIA_Sekob_Defeated_weich);
};

func void DIA_Sekob_Defeated_Weich()
{
	AI_Output (other, self, "DIA_Sekob_Defeated_weich_15_00"); //Fajn, âeknu to Onarovi.
	AI_Output (self, other, "DIA_Sekob_Defeated_weich_01_01"); //Díky, pane. Tisíceré díky!
	MIS_Sekob_RedeMitOnar = LOG_RUNNING;
	
	AI_StopProcessInfos (self);
};

			func void B_Sekob_Kassieren()
			{
				AI_Output (other, self, "DIA_Sekob_Kassieren_15_00"); //Pâestaà s têmi žvásty. Celou dobu tu pršelo a máš plné sýpky. Zaplaã hned teë, nebo tê zabiju.
				AI_Output (self, other, "DIA_Sekob_Kassieren_01_01"); //(podlézavê) Ne, prosím, tady je zlato. Ještê ti pâidám, když mê necháš naživu.
				B_GiveInvItems (self, other, ItMi_Gold, 60);
				AI_Output (other, self, "DIA_Sekob_Kassieren_15_02"); //Ani to nebolelo, co?
				AI_Output (self ,other, "DIA_Sekob_Kassieren_01_03"); //(zoufale) Jsem na mizinê.
				Sekob_Pachtbezahlt = TRUE;
			
				AI_StopProcessInfos (self);	
			};

func void DIA_Sekob_Defeated_hart()
{
	B_Sekob_Kassieren();
};


// ************************************************************
// 			  				Again (und nach Onar)
// ************************************************************
instance DIA_Sekob_Again		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_Again_Condition;
	information	= DIA_Sekob_Again_Info;
	permanent	= TRUE;
	description	= "K té rentê...";
};

func int DIA_Sekob_Again_Condition ()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Sekob_Defeated))
	&& (Sekob_Pachtbezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_Again_Info ()
{
	AI_Output (other, self, "DIA_Sekob_Again_15_00"); //K té rentê...
	AI_Output (self, other, "DIA_Sekob_Again_01_01"); //Mluvil jsi s Onarem, co?
	
	Info_ClearChoices	(DIA_Sekob_Again);
	Info_AddChoice	(DIA_Sekob_Again, "Zmênil jsem názor.", DIA_Sekob_Again_Nein);
	
	if (Onar_WegenSekob == TRUE)
	{
		Info_AddChoice	(DIA_Sekob_Again, "Byl jsem...", DIA_Sekob_Again_verarscht);
	}
	else
	{
		Info_AddChoice	(DIA_Sekob_Again, "Jasnê.", DIA_Sekob_Again_Ja);
	};
};

func void DIA_Sekob_Again_Nein()
{
	AI_Output (other, self, "DIA_Sekob_Again_Nein_15_00"); //Zmênil jsem názor.
	B_Sekob_Kassieren();
};

func void DIA_Sekob_Again_Ja()
{
	AI_Output (other, self, "DIA_Sekob_Again_Ja_15_00"); //Jasnê.
	AI_Output (self ,other, "DIA_Sekob_Again_Ja_01_01"); //Mùžeš to udêlat.
	
	AI_StopProcessInfos (self);
};
	
func void DIA_Sekob_Again_verarscht()
{
	MIS_Sekob_RedeMitOnar = LOG_SUCCESS;
	AI_Output (other, self, "DIA_Sekob_Again_verarscht_15_00"); //Byl jsem...
	AI_Output (self, other, "DIA_Sekob_Again_verarscht_01_01"); //A? Co âíkal?
	AI_Output (other, self, "DIA_Sekob_Again_verarscht_15_02"); //Je mi líto, ale teë tê musím pâipravit o hlavu.
	AI_Output (self, other, "DIA_Sekob_Again_verarscht_01_03"); //Ale proè? Co jsem udêlal?
	AI_Output (other, self, "DIA_Sekob_Again_verarscht_15_04"); //Hráls to na mê.
	AI_Output (self, other, "DIA_Sekob_Again_verarscht_01_05"); //Mluvil jsem pravdu - pâísahám!
	B_Sekob_Kassieren();
};

// ************************************************************
// 			  			Perm Kap 1
// ************************************************************
instance DIA_Sekob_PERMKAP1		(C_INFO)
{
	npc		 	 = 	BAU_930_Sekob;
	nr		     = 	6;
	condition	 = 	DIA_Sekob_PERMKAP1_Condition;
	information	 = 	DIA_Sekob_PERMKAP1_Info;
	permanent	 =  TRUE;
	description	 = 	"Pâíštê už zaplatíš vèas, jasný?";
};

func int DIA_Sekob_PERMKAP1_Condition ()
{
	if (Sekob_Pachtbezahlt == TRUE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERMKAP1_Info ()
{
	AI_Output (other, self, "DIA_Sekob_PERMKAP1_15_00"); //Pâíštê už zaplatíš vèas, jasný?
	AI_Output (self, other, "DIA_Sekob_PERMKAP1_01_01"); //(pro sebe) Èím jsem si tohle zasloužil...
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

INSTANCE DIA_Sekob_KAP3_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP3_EXIT_Condition;
	information	= DIA_Sekob_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DMt
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_DMT		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	30;
	condition	 = 	DIA_Sekob_DMT_Condition;
	information	 = 	DIA_Sekob_DMT_Info;

	description	 = 	"Nêco se stalo?";
};

func int DIA_Sekob_DMT_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMT_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_DMT_15_00"); //Nêco se stalo?
	AI_Output			(self, other, "DIA_Sekob_DMT_01_01"); //Budeš mi muset pomoct. Ty postavy v èerné kápi vpadly do mého domu.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output	(self, other, "DIA_Sekob_DMT_01_02"); //Vy, lidé z královské gardy, byste se mêli postarat o to, aby se všichni mêli dobâe, ne?
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Sekob_DMT_01_03"); //Vím, že vy žoldáci se moc o charitu nezajímáte, ale mùžu ti zaplatit.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Sekob_DMT_01_04"); //Budeš mi muset pomoct, vážený pane mágu.
		};

	AI_Output			(self, other, "DIA_Sekob_DMT_01_05"); //Ti chlápkové âíkali, že nêco hledají. Ale urèitê ne v mém domê.
	AI_Output			(self, other, "DIA_Sekob_DMT_01_06"); //Prosím, pomoz mi. Zaâië, aã vypadnou.

	Log_CreateTopic (TOPIC_SekobDMT, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SekobDMT, LOG_RUNNING);
	B_LogEntry (TOPIC_SekobDMT,"Èerní mágové vyhnali Sekoba z domu a já mám teë vypudit je."); 
};

///////////////////////////////////////////////////////////////////////
//	Info DMTWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_DMTWEG		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	31;
	condition	 = 	DIA_Sekob_DMTWEG_Condition;
	information	 = 	DIA_Sekob_DMTWEG_Info;

	description	 = 	"Tvùj dùm je prázdný. Ty èerné kápê už odešly.";
};

func int DIA_Sekob_DMTWEG_Condition ()
{
	if (Kapitel >= 3)	
	&& (Npc_KnowsInfo(other, DIA_Sekob_DMT))
	&& (Npc_IsDead(DMT_DementorAmbientSekob1))	
	&& (Npc_IsDead(DMT_DementorAmbientSekob2))	
	&& (Npc_IsDead(DMT_DementorAmbientSekob3))	
	&& (Npc_IsDead(DMT_DementorAmbientSekob4))	
		{
			return TRUE;
		};
};

func void DIA_Sekob_DMTWEG_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_DMTWEG_15_00"); //Tvùj dùm je prázdný. Èerné kápê už vypadly.
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output	(self, other, "DIA_Sekob_DMTWEG_01_01"); //Vêdêl jsem, že na stráž se dá spolehnout.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Sekob_DMTWEG_01_02"); //Udêlals poâádný kus práce. Onar mùže být rád, že má na své stranê lidi jako ty.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Sekob_DMTWEG_01_03"); //Díky, vážený pane mágu. Co by s námi bylo, kdybychom nad sebou nemêli ochranou ruku církve?
		};
	TOPIC_END_SekobDMT = TRUE;
	B_GivePlayerXP (XP_SekobDMTWEG);

	if (Kapitel < 5)
	{
		Npc_ExchangeRoutine	(self,"Zaèít");
	}
	else
	{
		Npc_ExchangeRoutine	(self,"Posedlý");
	};
	
	if (Rosi_FleeFromSekob_Kap5 == FALSE)
	{
		B_StartOtherRoutine (Rosi,"Zaèít"); 
		B_StartOtherRoutine (Till,"Zaèít"); 
	};
	B_StartOtherRoutine (Balthasar,"Zaèít"); 
	B_StartOtherRoutine (BAU_933_Rega,"Zaèít"); 
	B_StartOtherRoutine (BAU_934_Babera,"Zaèít"); 
	B_StartOtherRoutine (BAU_937_BAUER,"Zaèít"); 
	B_StartOtherRoutine (BAU_938_BAUER,"Zaèít"); 

};

///////////////////////////////////////////////////////////////////////
//	Info Belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_BELOHNUNG		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	32;
	condition	 = 	DIA_Sekob_BELOHNUNG_Condition;
	information	 = 	DIA_Sekob_BELOHNUNG_Info;

	description	 = 	"Ne tak rychle, pâíteli.";
};

func int DIA_Sekob_BELOHNUNG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sekob_DMTWEG))
	&& (Kapitel >= 3)	
		{
				return TRUE;
		};
};

func void DIA_Sekob_BELOHNUNG_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_00"); //Ne tak rychle, pâíteli.

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			if (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
				{
					AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_01"); //Od teë už nepatâíš k tý špinavý lùze a místo toho se budeš èinit pro obecné blaho. Jinak si na tebe došlápnu.
				};		
			AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_02"); //Nerozumím. Co ještê chceš?
		};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_03"); //Nêco jsi blábolil o odmênê, ne? Nebo jsem jen slyšel trávu rùst?
		};

	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_04"); //Zajímá mê jen jediná vêc. Co chtêly ty èerné kápê ve tvém domê?
			AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_05"); //Sám si to nedokážu vysvêtlit, vážený pane mágu. Snad...
			AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_06"); //Co?
			AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_07"); //Je mi líto. Pâed nêkolika lety jsem pâísahal, že o tom nebudu mluvit, a nemám v úmyslu porušit své slovo.
		};

	AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_08"); //Jediné, co mùžu udêlat, je, že ti dám trochu zlata a požádám tê, abys mê ušetâil.
	AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_09"); //Tak to sem teda dej. Spêchám.
	AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_10"); //Tady.
	CreateInvItems (self, ItMi_Gold, 250);									
	B_GiveInvItems (self, other, ItMi_Gold, 250);
	AI_StopProcessInfos (self);					

};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_PERM		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	80;
	condition	 = 	DIA_Sekob_PERM_Condition;
	information	 = 	DIA_Sekob_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Stalo se tu mezitím nêco?";
};

func int DIA_Sekob_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sekob_BELOHNUNG))
	&& (Kapitel >= 3)	
	&& (NpcObsessedByDMT_Sekob == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Sekob_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
	&& (Kapitel >= 5)
		{
			B_NpcObsessedByDMT (self);
		}
	else
		{
			AI_Output		(other, self, "DIA_Sekob_PERM_15_00"); //Stalo se tu mezitím nêco?
			
			if (MIS_bringRosiBackToSekob == LOG_FAILED)
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_01"); //Zmizni.
			}
			else if (MIS_bringRosiBackToSekob == LOG_SUCCESS)
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_02"); //Ne. Nic zvláštního.
			}
			else if (Kapitel >= 5)
			&& (MIS_bringRosiBackToSekob != LOG_SUCCESS)
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_03"); //Moje žena zmizela. Nejdâív jsem si toho vùbec nevšiml... a pak najednou byla pryè.
				AI_Output		(self, other, "DIA_Sekob_PERM_01_04"); //Nejspíš se schovala v lese, aby unikla polním škùdcùm.
				AI_Output		(self, other, "DIA_Sekob_PERM_01_05"); //Udêlej mi laskavost, když ji najdeš, vraã mi ji živou a zdravou.
				MIS_bringRosiBackToSekob = LOG_RUNNING;
				Log_CreateTopic (TOPIC_bringRosiBackToSekob, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_bringRosiBackToSekob, LOG_RUNNING);
				B_LogEntry (TOPIC_bringRosiBackToSekob,"Sekobova žena Rosi zmizela a její muž by byl rád, kdyby jí nêkdo 'dopomohl' k návratu."); 
			}
			else
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_06"); //Nic, od té doby, co jsou ti nièemové v èerném nastêhovaní v mém domê.
			};
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

INSTANCE DIA_Sekob_KAP4_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP4_EXIT_Condition;
	information	= DIA_Sekob_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP4_EXIT_Info()
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

INSTANCE DIA_Sekob_KAP5_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP5_EXIT_Condition;
	information	= DIA_Sekob_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_Heilung		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	55;
	condition	 = 	DIA_Sekob_Heilung_Condition;
	information	 = 	DIA_Sekob_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Máš problém.";
};

func int DIA_Sekob_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Sekob == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& (Kapitel >= 5)
	 {
				return TRUE;
	 };
};

var int DIA_Sekob_Heilung_oneTime;
func void DIA_Sekob_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_Heilung_15_00"); //Máš problém.

	if (DIA_Sekob_Heilung_oneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Sekob_Heilung_01_01"); //Jo, to teda mám. TY jsi mùj problém, ty mizernej mágu. Vypadni, nebo z tebe stáhnu kùži zaživa.
		AI_Output			(other, self, "DIA_Sekob_Heilung_15_02"); //(pro sebe) To je teda têžkej pâípad.
	
		B_NpcClearObsessionByDMT (self);
		DIA_Sekob_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Sekob_Heilung_01_03"); //Ty prostê neposlechneš, co?
		AI_Output			(other, self, "DIA_Sekob_Heilung_15_04"); //(pro sebe) Beznadêjnej pâípad.
		B_NpcClearObsessionByDMT (self);
		B_Attack (self, other, AR_NONE, 1);
	};

};


///////////////////////////////////////////////////////////////////////
//	Info rosibackatSekob
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_ROSIBACKATSEKOB		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	53;
	condition	 = 	DIA_Sekob_ROSIBACKATSEKOB_Condition;
	information	 = 	DIA_Sekob_ROSIBACKATSEKOB_Info;

	description	 = 	"Pâivedl jsem ti zpêt tvou ženu.";
};

func int DIA_Sekob_ROSIBACKATSEKOB_Condition ()
{
	if (Kapitel >= 5)
	&& (hero.guild != GIL_KDF)
	&& (Npc_GetDistToWP(Rosi,"NW_FARM4_SEKOB")<3000)
	&& (MIS_bringRosiBackToSekob == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Sekob_ROSIBACKATSEKOB_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_ROSIBACKATSEKOB_15_00"); //Pâivedl jsem ti zpêt tvou ženu.
	AI_Output			(self, other, "DIA_Sekob_ROSIBACKATSEKOB_01_01"); //To je bájeèný. Tady, vezmi si to za svoji námahu.
	MIS_bringRosiBackToSekob = LOG_SUCCESS;
	CreateInvItems (self, ItMi_Gold, 650);									
	B_GiveInvItems (self, other, ItMi_Gold, 650);					
	B_GivePlayerXP (XP_Ambient);
	B_NpcClearObsessionByDMT (self);
	B_StartOtherRoutine	(Rosi,"Zaèít");
	B_StartOtherRoutine	(Till,"Zaèít");

};

///////////////////////////////////////////////////////////////////////
//	Info rosineverback
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_ROSINEVERBACK		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	56;
	condition	 = 	DIA_Sekob_ROSINEVERBACK_Condition;
	information	 = 	DIA_Sekob_ROSINEVERBACK_Info;

	description	 = 	"Rosi se k tobê už nevrátí. Odvedl jsem ji do bezpeèí.";
};

func int DIA_Sekob_ROSINEVERBACK_Condition ()
{
	if (MIS_bringRosiBackToSekob == LOG_OBSOLETE)
	&& (hero.guild != GIL_KDF)
		{
				return TRUE;
		};
};

func void DIA_Sekob_ROSINEVERBACK_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_ROSINEVERBACK_15_00"); //Rosi už se k tobê nikdy nevrátí. Vzal jsem ji na bezpeèné místo.
	AI_Output			(self, other, "DIA_Sekob_ROSINEVERBACK_01_01"); //Bezpeèné? Pâed kým?
	AI_Output			(other, self, "DIA_Sekob_ROSINEVERBACK_15_02"); //Pâed tebou.
	AI_Output			(self, other, "DIA_Sekob_ROSINEVERBACK_01_03"); //Toho budeš litovat, ty svinê.
	B_NpcClearObsessionByDMT (self);
	B_Attack (self, other, AR_NONE, 1);
	B_GivePlayerXP (XP_Ambient);
	MIS_bringRosiBackToSekob = LOG_FAILED;

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


INSTANCE DIA_Sekob_KAP6_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP6_EXIT_Condition;
	information	= DIA_Sekob_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sekob_PICKPOCKET (C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 900;
	condition	= DIA_Sekob_PICKPOCKET_Condition;
	information	= DIA_Sekob_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Sekob_PICKPOCKET_Condition()
{
	C_Beklauen (75, 230);
};
 
FUNC VOID DIA_Sekob_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sekob_PICKPOCKET);
	Info_AddChoice		(DIA_Sekob_PICKPOCKET, DIALOG_BACK 		,DIA_Sekob_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sekob_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sekob_PICKPOCKET_DoIt);
};

func void DIA_Sekob_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sekob_PICKPOCKET);
};
	
func void DIA_Sekob_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sekob_PICKPOCKET);
};















































