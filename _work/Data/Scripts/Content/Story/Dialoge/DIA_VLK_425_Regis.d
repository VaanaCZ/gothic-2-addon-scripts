///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Regis_EXIT   (C_INFO)
{
	npc         = VLK_425_Regis;
	nr          = 999;
	condition   = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Regis_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Regis_PICKPOCKET (C_INFO)
{
	npc			= VLK_425_Regis;
	nr			= 900;
	condition	= DIA_Regis_PICKPOCKET_Condition;
	information	= DIA_Regis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Regis_PICKPOCKET_Condition()
{
	C_Beklauen (40, 35);
};
 
FUNC VOID DIA_Regis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Regis_PICKPOCKET);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_BACK 		,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
	
func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Hallo		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	1;
	condition	 = 	DIA_Regis_Hallo_Condition;
	information	 = 	DIA_Regis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Regis_Hallo_Condition ()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Regis_Hallo_Info ()
{	
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //Hej, tys v tomhle mêstê nový, co?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //Ano, a co ty?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //Pâišel jsem z pevniny a teë se tu jen tak poflakuju. Už mi skoro došly peníze, takže mi nejspíš nezbude nic jiného než se pâidat k domobranê.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //Ale já tam nechci. Nemíním se nechat ve jménu krále zabít nêjakými špinavými skâety.
};
///////////////////////////////////////////////////////////////////////
//	Info MILIZ
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_MILIZ		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_MILIZ_Condition;
	information	 = 	DIA_Regis_MILIZ_Info;
	permanent    =  FALSE;
	description	 = 	"Co bys mi âekl o domobranê?";
};
func int DIA_Regis_MILIZ_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_Hallo) 
	{
		return TRUE;
	};
};
func void DIA_Regis_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //Co bys mi âekl o domobranê?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //Vede ji jeden z paladinù, jistý lord Andre.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //Pokouší se zmobilizovat pùlku mêsta pro pâípad, že by nás napadli skâeti.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //Ale chceš-li se nechat najmout, musíš se napâed stát obèanem mêsta.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //Pokud vím, tak ty nejsi zdejším obèanem, takže i když budeš cvièit sebevíc, stejnê tê oficiálnê nepâijmou.
};
///////////////////////////////////////////////////////////////////////
//	Info ANDRE
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_ANDRE		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ANDRE_Condition;
	information	 = 	DIA_Regis_ANDRE_Info;
	permanent    =  FALSE;
	description	 = 	"Co dalšího mi ještê mùžeš prozradit o lordu Andrem?";
};
func int DIA_Regis_ANDRE_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_MILIZ) 
	{
		return TRUE;
	};
};
func void DIA_Regis_ANDRE_Info ()
{
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //Co dalšího mi ještê mùžeš prozradit o lordu Andrem?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //Také tu zastává funkci soudce.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //Pokud ve mêstê nêco provedeš, budeš se zodpovídat jemu.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //Jednou jsem se takhle s nêkým popral.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //On si pak šel stêžovat lordu Andremu a udal mê.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //Celá ta záležitost mê pâišla na 50 zlaãákù.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //A to jsem mêl kliku, že se to stalo v noci, a tak u toho nebyli žádní svêdkové.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //Èím víc lidí si na tebe totiž stêžuje, tím vyšší pokutu pak musíš zaplatit.
};

// ****************************************************
// 					Prügelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_Valentino_Condition;
	information	 = 	DIA_Regis_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"S kým jsi bojoval?";
};
func int DIA_Regis_Valentino_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_ANDRE) 
	{
		return TRUE;
	};
};
func void DIA_Regis_Valentino_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //S kým jsi bojoval?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //S chlápkem jménem Valentino - èasto se poflakuje kolem putyky poblíž chrámu.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //Já tedy nejsem žádný násilník, ale TENHLE maník si zaslouží, aby mu nêkdo poâádnê zmaloval ciferník.
};

// ****************************************************
// 					Valentino DEFEATED
// ****************************************************
instance DIA_Regis_ValDefeat (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ValDefeat_Condition;
	information	 = 	DIA_Regis_ValDefeat_Info;
	permanent    =  FALSE;
	description	 = 	"Setkal jsem se s Valentinem...";
};
func int DIA_Regis_ValDefeat_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Regis_Valentino))
	&& (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_ValDefeat_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //Setkal jsem se s Valentinem...
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //A?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //Dal jsem mu pár facek.
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //(smêje se) Zasloužil si to.
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //Tumáš - tenhle prsten jsem od nêj získal, když se náš malý spor urovnal.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //(kâení se) Mùžeš ho pak vênovat prvnímu, kdo mu dá pár pâes hubu.
	};
};

// **************************************************************
// 							PERM
// **************************************************************
//--------------------------
	var int Regis_Bogendieb;
//--------------------------
instance DIA_Regis_PERM		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr 			 =  200;
	condition	 = 	DIA_Regis_PERM_Condition;
	information	 = 	DIA_Regis_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Stalo se tu nêco zajímavého?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //Stalo se tu nêco zajímavého?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //Dalo by se to tak âíct.
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //Okradli výrobce lukù Bospera - takovou drzost aby pohledal!
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //Ten maník prostê za bílého dne vešel do krámu a rychle èmajznul jeden z lukù.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //A Bosper hned za ním a hulákal: "Stùj, ty zlodêji!" Ale lupiè byl rychlejší.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //Nêjaký poctivý nálezce vrátil ukradený luk zpátky Bosperovi.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //To je divné - èlovêk by si myslel, že se dnes každý stará jen sám o sebe, ale tenhle chlap byl jiný a luk vrátil.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //No, všechno je v klidu. Poèítám, že až sem pâitáhnou skâeti, urèitê si jich všimneme.
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //Nakonec zjistili, že ten žoldák je nevinný, a museli ho pustit.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //Lord Hagen musí být vzteky bez sebe.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //Je toho plné mêsto. Pamatuješ se na paladina Lothara?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //Možná.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //Tak ten je mrtvý. Zabili ho pâímo na ulici a samozâejmê z toho obvinili žoldáky, jak jinak.
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Crew		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	51;
	condition	 = 	DIA_Regis_Crew_Condition;
	information	 = 	DIA_Regis_Crew_Info;
	permanent    =  FALSE;
	description	 = 	"Pokouším se najít posádku na cestu po moâi.";
};
func int DIA_Regis_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_Crew_Info ()
{
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //Pokouším se najít posádku na cestu po moâi.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //Tak s tím ti nepomùžu. Nejspíš by ses mêl porozhlédnout po pâístavu nebo se poptat nêkde v hospodê.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //Jestli tu zùstali ještê nêjací námoâníci, urèitê je najdeš tam.

};


