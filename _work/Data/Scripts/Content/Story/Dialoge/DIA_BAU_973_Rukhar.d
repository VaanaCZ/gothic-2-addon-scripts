///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rukhar_EXIT   (C_INFO)
{
	npc         = BAU_973_Rukhar;
	nr          = 999;
	condition   = DIA_Rukhar_EXIT_Condition;
	information = DIA_Rukhar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rukhar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rukhar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HALLO		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	4;
	condition	 = 	DIA_Rukhar_HALLO_Condition;
	information	 = 	DIA_Rukhar_HALLO_Info;

	description	 = 	"Je tady dobré pivo?";
};

func int DIA_Rukhar_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rukhar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HALLO_15_00"); //Je tady dobré pivo?
	AI_Output			(self, other, "DIA_Rukhar_HALLO_12_01"); //Není to zrovna excelentní, ale v têchhle temnejch èasech si nemùžeš moc vybírat.

};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	5;
	condition	 = 	DIA_Rukhar_WASMACHSTDU_Condition;
	information	 = 	DIA_Rukhar_WASMACHSTDU_Info;

	description	 = 	"Co tady dêláš?";
};

func int DIA_Rukhar_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_WASMACHSTDU_15_00"); //Co tady dêláš?
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_01"); //Až do minulého týdne jsem dâel jak mezek na polích velkostatkáâe.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_02"); //Jednoho dne už jsem toho prostê mêl dost, a tak jsem odtamtud vypadnul.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_03"); //Teë jsem svým vlastním pánem. Všechno, co vlastním, je tady v té truhle. A to je taky vše, co potâebuju.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_04"); //Mêl bys zájem o menší soutêž?
	Log_CreateTopic (TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry (TOPIC_Wettsaufen,"V hospodê se uzavírají sázky."); 

};


///////////////////////////////////////////////////////////////////////
//	Info Wettkampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_WETTKAMPF		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_WETTKAMPF_Condition;
	information	 = 	DIA_Rukhar_WETTKAMPF_Info;

	description	 = 	"A jaká soutêž by to mêla být?";
};

func int DIA_Rukhar_WETTKAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_WASMACHSTDU))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_WETTKAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_WETTKAMPF_15_00"); //A jaká soutêž by to mêla být?
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_01"); //Âíkám tomu DO DNA.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_02"); //Pravidla jsou docela jednoduchá.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_03"); //Budeme se stâídat v objednávání korbelù toho nejlepšího piva, co mùže ten chlap nabídnout.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_04"); //Každý korbel musíš do sebe hodit na ex. Nesmí po nêm zbejt na stole ani mokrej kroužek.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_05"); //Kdo vydrží nejdýl, vyhrává. Poražený platí útratu a sázku. Tak co, jdeš do toho?
	AI_Output			(other, self, "DIA_Rukhar_WETTKAMPF_15_06"); //Možná jindy, až nebudu mít tak naspêch.

};

///////////////////////////////////////////////////////////////////////
//	Info HoleRandolph
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HOLERANDOLPH		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_HOLERANDOLPH_Condition;
	information	 = 	DIA_Rukhar_HOLERANDOLPH_Info;

	description	 = 	"A mùžu si tedy vsadit na nêkoho jiného?";
};

func int DIA_Rukhar_HOLERANDOLPH_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_WETTKAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_HOLERANDOLPH_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HOLERANDOLPH_15_00"); //Mùžu si taky vsadit na nêkoho jiného?
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_01"); //Samozâejmê. Když dokážeš sehnat nêkoho, kdo bude mít odvahu se mi postavit, pak se se mnou mùžeš vsadit.
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_02"); //Všichni dávají stejný vklad. Vítêz bere všechno. Výška sázky záleží jen na tvé penêžence.
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_03"); //Dohoë mi nêkoho, kdo bude mít dost odvahy si to se mnou rozdat, a mùžeš si vsadit.
	B_LogEntry (TOPIC_Wettsaufen,"Rukhar té své hâe âíká NA EX! Ne, díky, ale to mê nezajímá. Radši najdu nêkoho jiného, z koho mùže dêlat kašpara."); 

};

///////////////////////////////////////////////////////////////////////
//	Info RandolphWill
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_RANDOLPHWILL		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_RANDOLPHWILL_Condition;
	information	 = 	DIA_Rukhar_RANDOLPHWILL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mám nêkoho, kdo by s tebou chtêl soupeâit.";
};

var int DIA_Rukhar_RANDOLPHWILL_noPerm;

func int DIA_Rukhar_RANDOLPHWILL_Condition ()
{
	if  (
		(Npc_KnowsInfo(other, DIA_Randolph_GEGENWEN))
		&& (Npc_KnowsInfo(other, DIA_Rukhar_HOLERANDOLPH))
		&& (DIA_Rukhar_RANDOLPHWILL_noPerm == FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Rukhar_RANDOLPHWILL_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_15_00"); //Mám nêkoho, kdo by chtêl s tebou soupeâit.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_01"); //Kdo by to mohl být?
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_15_02"); //Randolph.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_03"); //Ho, hó. Chvastoun Randolph? Dobrá. Proè ne.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_04"); //Pošli mi sem toho strašpytla a já zaâídím zbytek.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_05"); //Sebere se až tak za dva dny. Kdo ví? Tâeba budeš mít štêstí a on se pak ještê nêkdy postaví.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_06"); //Jaká je tvoje sázka?

	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);

	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "Nic.", DIA_Rukhar_RANDOLPHWILL_nix );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "100", DIA_Rukhar_RANDOLPHWILL_100 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "50", DIA_Rukhar_RANDOLPHWILL_50 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "20", DIA_Rukhar_RANDOLPHWILL_20 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "10 zlatých", DIA_Rukhar_RANDOLPHWILL_10 );
};
func void DIA_Rukhar_RANDOLPHWILL_annehmen ()
{
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_annehmen_12_00"); //Vezmu si tvou sázku a bude u mê až do konce soutêže, dobrá?
	DIA_Rukhar_RANDOLPHWILL_noPerm = TRUE;
};

func void DIA_Rukhar_RANDOLPHWILL_mehr ()
{
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);

	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "Nic.", DIA_Rukhar_RANDOLPHWILL_nix );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "50", DIA_Rukhar_RANDOLPHWILL_100 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "50", DIA_Rukhar_RANDOLPHWILL_50 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "20", DIA_Rukhar_RANDOLPHWILL_20 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "10 zlatých", DIA_Rukhar_RANDOLPHWILL_10 );
};


func void DIA_Rukhar_RANDOLPHWILL_nix ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_nix_15_00"); //Nic.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_nix_12_01"); //Tak to mùžem na celou vêc zapomenout.

	AI_StopProcessInfos (self);
};

func void DIA_Rukhar_RANDOLPHWILL_10 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_10_15_00"); //10 zlatých
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_10_12_01"); //Hele, tohle nemùžeš myslet vážnê. O nêco víc zlata tê snad nezabije.

	Rukhar_Einsatz = 10;
	Rukhar_Gewinn = 20;

	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(Zvolit jinou sázku.)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(Pâijmout sázku.)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_20 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_20_15_00"); //20
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_20_12_01"); //Když už se chceš vsázet, tak to laskavê dêlej poâádnê.

	Rukhar_Einsatz = 20;
	Rukhar_Gewinn = 40;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(Zvolit jinou sázku.)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(Pâijmout sázku.)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_50 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_50_15_00"); //50
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_50_12_01"); //Nedrž se tak pâi zdi. Trochu odvahy.

	Rukhar_Einsatz = 50;
	Rukhar_Gewinn = 100;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(Zvolit jinou sázku.)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(Pâijmout sázku.)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_100 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_100_15_00"); //100
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_100_12_01"); //To jsem chtêl slyšet.
	
	Rukhar_Einsatz = 100;
	Rukhar_Gewinn = 200;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(Zvolit jinou sázku.)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(Pâijmout sázku.)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

///////////////////////////////////////////////////////////////////////
//	Info IchSeheDich
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_ICHSEHEDICH		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_ICHSEHEDICH_Condition;
	information	 = 	DIA_Rukhar_ICHSEHEDICH_Info;
	permanent	 = 	TRUE;
	
	description	=	"Tady je mùj vklad.";
};

var int DIA_Rukhar_ICHSEHEDICH_noPerm;

func int DIA_Rukhar_ICHSEHEDICH_Condition ()
{
	if 	(
		(DIA_Rukhar_ICHSEHEDICH_noPerm == FALSE)
		&& (DIA_Rukhar_RANDOLPHWILL_noPerm == TRUE)
		&& (Rukhar_Einsatz != 0)
		)
			{
					return TRUE;
			};
};

func void DIA_Rukhar_ICHSEHEDICH_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_ICHSEHEDICH_15_00"); //Tady je mùj vklad.

	if (B_GiveInvItems (other, self, ItMi_Gold, Rukhar_Einsatz))
		{
			AI_Output			(self, other, "DIA_Rukhar_ICHSEHEDICH_12_01"); //Dobrá. Moc tady Randolpha nezdržuj, slyšíš?
			DIA_Rukhar_ICHSEHEDICH_noPerm = TRUE;
			MIS_Rukhar_Wettkampf = LOG_RUNNING; 
			B_GivePlayerXP (XP_Ambient);
		}
	else
		{
			AI_Output			(self, other, "DIA_Rukhar_ICHSEHEDICH_12_02"); //To je sranda. Vraã se, až budeš mít dost penêz.
		};
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info geldzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_GELDZURUECK		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_GELDZURUECK_Condition;
	information	 = 	DIA_Rukhar_GELDZURUECK_Info;
	permanent	 = 	TRUE;
	
	description	 = 	"Chci zpátky svoje peníze.";
};

func int DIA_Rukhar_GELDZURUECK_Condition ()
{
	if 	(
		(MIS_Rukhar_Wettkampf == LOG_SUCCESS)
		&& (Rukhar_Won_Wettkampf == TRUE)
		)
	{
				return TRUE;
	};
};

func void DIA_Rukhar_GELDZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_GELDZURUECK_15_00"); //Chci zpátky svoje peníze.
	AI_Output			(self, other, "DIA_Rukhar_GELDZURUECK_12_01"); //Herní sázky jsou sázkami cti, kámo. Mêl sis to rozmyslet dâív.

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Haenseln
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HAENSELN		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_HAENSELN_Condition;
	information	 = 	DIA_Rukhar_HAENSELN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vypadáš, že sis vzal vêtší sousto, než dokážeš spolknout.";
};

func int DIA_Rukhar_HAENSELN_Condition ()
{
	if 	(
		(MIS_Rukhar_Wettkampf == LOG_SUCCESS)
		&& (Rukhar_Won_Wettkampf == FALSE)
		)
	{
				return TRUE;
	};
};

var int DIA_Rukhar_HAENSELN_nureimalgeld;

func void DIA_Rukhar_HAENSELN_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HAENSELN_15_00"); //Vypadáš, že sis vzal vêtší sousto, než dokážeš spolknout.

	if	(DIA_Rukhar_HAENSELN_nureimalgeld == FALSE)
		{
			AI_Output			(self, other, "DIA_Rukhar_HAENSELN_12_01"); //Tady jsou tvé peníze a už ani slovo.
			B_GivePlayerXP (XP_Rukhar_Lost);

			IntToFloat (Rukhar_Gewinn);
					
			CreateInvItems (self, ItMi_Gold, Rukhar_Gewinn);									
			B_GiveInvItems (self, other, ItMi_Gold, Rukhar_Gewinn);					

			DIA_Rukhar_HAENSELN_nureimalgeld = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Rukhar_HAENSELN_12_02"); //Ještê si to s tebou vyâídím, na to se mùžeš spolehnout.
		};

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_Perm		(C_INFO)
{
	npc			 = 	BAU_973_Rukhar;
	nr		 = 	7;
	condition	 = 	DIA_Rukhar_Perm_Condition;
	information	 = 	DIA_Rukhar_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"Stalo se ještê nêco, co by stálo za âeè?";
};

func int DIA_Rukhar_Perm_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Rukhar_WASMACHSTDU))
		{
				return TRUE;
		};
};
func void DIA_Rukhar_Perm_Info ()
{
	AI_Output (other, self, "DIA_Rukhar_Perm_15_00"); //Stalo se ještê nêco, co by stálo za âeè?
	AI_Output (self, other, "DIA_Rukhar_Perm_12_01"); //Nic, o èem bych vêdêl. Nikdo mi nic neâekl.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rukhar_PICKPOCKET (C_INFO)
{
	npc			= BAU_973_Rukhar;
	nr			= 900;
	condition	= DIA_Rukhar_PICKPOCKET_Condition;
	information	= DIA_Rukhar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Rukhar_PICKPOCKET_Condition()
{
	C_Beklauen (26, 30);
};
 
FUNC VOID DIA_Rukhar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rukhar_PICKPOCKET);
	Info_AddChoice		(DIA_Rukhar_PICKPOCKET, DIALOG_BACK 		,DIA_Rukhar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rukhar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rukhar_PICKPOCKET_DoIt);
};

func void DIA_Rukhar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rukhar_PICKPOCKET);
};
	
func void DIA_Rukhar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rukhar_PICKPOCKET);
};




 


























