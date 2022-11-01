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
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //Hej, nowy w mieście, co?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //Tak, ale co ci do tego?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //Niedawno przybyłem z kontynentu, teraz włóczę się bez celu. Złoto niemal mi się skończyło, nie pozostanie mi więc chyba nic innego, jak tylko przyłączyć się do straży.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //Nie chcę tego jednak. To żadna przyjemność zostać rozszarpanym przez orków, w imię Króla.
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
	description	 = 	"Co możesz mi powiedzieć na temat straży?";
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
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //Co możesz mi powiedzieć na temat straży?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //Jeden z paladynów przejął niedawno dowodzenie. Niejaki Lord Andre.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //Próbuje zmobilizować połowę miasta do walki przeciwko orkom.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //Jednak, żeby się zaciągnąć, trzeba być obywatelem miasta.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //Z tego co wiem, to nie będąc obywatelem, można trenować, nie zostanie się jednak oficjalnie przyjętym.
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
	description	 = 	"Co jeszcze możesz mi powiedzieć o Lordzie Andre?";
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
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //Co jeszcze możesz mi powiedzieć o Lordzie Andre?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //Wiem, że objął także funkcję sędziego.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //Jeśli wdasz się w jakieś kłopoty w mieście, będziesz musiał przed nim odpowiadać.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //Zdarzyło mi się raz wdać w bójkę z jednym z obywateli.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //Ten pobiegł z płaczem do Lorda Andre i doniósł na mnie.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //Ta drobnostka kosztowała mnie 50 sztuk złota.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //Całe szczęście, że zajście miało miejsce w nocy i nie było świadków.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //Im więcej osób naskarży na ciebie władzom, tym wyższą karę dostaniesz.
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
	description	 = 	"Z kim się pobiłeś?";
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
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //Z kim się pobiłeś?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //Koleś nazywa się Valentino. Często przesiaduje w knajpie, w pobliżu świątyni.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //Na ogół, nie uznaję przemocy. Ale TEN człowiek zasłużył na to, żeby przerobić mu trochę facjatę.
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
	description	 = 	"Poznałem Valentina.";
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
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //Poznałem Valentina.
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //I?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //Sprawiłem mu tęgie lanie...
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //Zasługiwał na to...
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //Podczas naszej małej sprzeczki znalazłem przy nim ten pierścień.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //Możesz go przekazać następnej osobie, która da mu w mordę...
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
	description	 = 	"Czy ostatnio wydarzyło się coś ciekawego?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //Czy ostatnio wydarzyło się coś ciekawego?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //Można by tak powiedzieć.
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //Okradziono Bospera, miejscowego łuczarza. Co za tupet.
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //Koleś po prostu wszedł do sklepu, w środku dnia, i zabrał stamtąd łuk.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //Bosper wyskoczył za nim jak poparzony, krzycząc: 'Stój, zatrzymaj się, draniu!' Złodziej jednak był szybszy.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //Ostatnio jakiś uczciwy znalazca odniósł łuk Bosperowi.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //To dziwne, mogłoby się wydawać, że każdy chce dla siebie jak najwięcej, a ten koleś po prostu wraca i oddaje łuk.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //Cóż, wszystko po staremu. Jeśli zaatakują nas orkowie, na pewno to zauważymy...
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //Okazało się, że najemnik był niewinny. Z tego co wiem, wypuszczono go na wolność.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //Lord Hagen musi być zielony ze złości.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //Całe miasto jest rozsierdzone. Pamiętasz paladyna Lothara?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //Być może.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //Tak czy inaczej, nie żyje. Jak zwykle, obwiniają najemników.
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
	description	 = 	"Szukam załogi, która wyruszyłaby ze mną na morze.";
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
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //Szukam załogi, która wyruszyłaby ze mną na morze.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //W tej kwestii nie mogę ci pomóc. Powinieneś poszukać kogoś w okolicach portu, może w okolicznych knajpach.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //Jeśli w mieście są jeszcze jacyś żeglarze, to pewnie tam właśnie ich znajdziesz.

};


