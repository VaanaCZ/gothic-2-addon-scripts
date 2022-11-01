///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Farim_EXIT   (C_INFO)
{
	npc         = VLK_4301_Addon_Farim;
	nr          = 999;
	condition   = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Farim_PICKPOCKET (C_INFO)
{
	npc			= VLK_4301_Addon_Farim;
	nr			= 900;
	condition	= DIA_Addon_Farim_PICKPOCKET_Condition;
	information	= DIA_Addon_Farim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Farim_PICKPOCKET_Condition()
{
	C_Beklauen (20, 11);
};
 
FUNC VOID DIA_Addon_Farim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
	
func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Hallo		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Hallo_Condition;
	information	 = 	DIA_Addon_Farim_Hallo_Info;

	description	 = 	"Jesteś rybakiem?";
};

func int DIA_Addon_Farim_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Hallo_15_00"); //Jesteś rybakiem?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_01"); //Jak na to wpadłeś?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_02"); //Może po prostu zostawisz mnie w spokoju, co?
	if (hero.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //Nie mam nic do ciebie, ale ostatnio miałem sporo nieprzyjemnych starć ze strażą, więc rozumiesz...
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //Nie oceniaj mnie zbyt pochopnie. Po prostu jestem w podłym nastroju. Kłopoty ze strażą, rozumiesz...
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MilizProbs
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MilizProbs		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MilizProbs_Condition;
	information	 = 	DIA_Addon_Farim_MilizProbs_Info;

	description	 = 	"Kłopoty ze strażą?";
};

func int DIA_Addon_Farim_MilizProbs_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MilizProbs_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //Kłopoty ze strażą?
	if (((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //Ci dranie regularnie mnie nachodzą i zabierają, co im się żywnie podoba!
	};
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //W ostatnim tygodniu zabrali mi cały połów. Powiedzieli, że to "dla wspólnego dobra"!
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //Wiem, że jesteśmy zdani na własne siły od czasu, gdy farmerzy przestali handlować.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //Niektórzy jedzą porządny posiłek raz na tydzień. Nic dziwnego, że straż zabrała mi wszystkie ryby.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //Ale jeśli tak dalej pójdzie, to wkrótce sam zacznę głodować.
	
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Daj mi swoje ryby.", DIA_Addon_Farim_MilizProbs_klauen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Może będę mógł ci jakoś pomóc.", DIA_Addon_Farim_MilizProbs_helfen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Rozmawiałeś o tym z paladynami?", DIA_Addon_Farim_MilizProbs_paladine );
};
func void DIA_Addon_Farim_MilizProbs_paladine ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //Rozmawiałeś o tym z paladynami?
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //Żartujesz chyba! A co ich obchodzi, że taki chudopachołek, jak ja, ma problemy ze strażą?
};
var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //Daj mi swoje ryby.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //Wiedziałem. Kolejny z tych siepaczy.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //Obawiam się, że przyszedłeś trochę za późno. Twoi kompani zabrali wszystko już wczoraj.
	};
	
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //Myślę, że już czas na ciebie.
	Farim_PissedOff = TRUE;
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
};
func void DIA_Addon_Farim_MilizProbs_helfen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //Może będę mógł ci jakoś pomóc.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //Bo ja wiem... Musiałbyś znać kogoś w straży, kto ma dojście do paladynów...
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //Sami paladyni raczej nie KUPIĄ ode mnie ryb.
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //Zobaczę, co da się zrobić.
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	
	Log_CreateTopic (TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_FarimsFish,"Rybak Farim ma kłopoty ze strażą, która zabiera mu zbyt wiele ryb, by mógł zarobić na życie. Muszę znaleźć w straży kogoś, kto ma wpływ na paladynów, i pomóc Farimowi."); 
		
	MIS_Addon_Farim_PaladinFisch = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MartinHelps
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MartinHelps		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MartinHelps_Condition;
	information	 = 	DIA_Addon_Farim_MartinHelps_Info;

	description	 = 	"Wiem już, jak rozwiązać twoje problemy.";
};

func int DIA_Addon_Farim_MartinHelps_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Martin_KnowsFarim == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MartinHelps_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //Wiem już, jak rozwiązać twoje problemy.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //Zamieniam się w słuch.

	if (hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)
	{
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //Jestem tu od niedawna i mało mogę.
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //Ale znam kogoś, kto mógłby ci pomóc.
	};
	
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //Martin, kwatermistrz paladynów, powiedział, że chętnie wysłucha twojej skargi.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //Myślisz, że powie strażnikom, by zostawili mnie w spokoju?
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //Tak powiedział.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //Dobrze. Wielkie dzięki. Niestety, nie mogę ci się odwdzięczyć. Chociaż...
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //Ten dziwny błękitny kamień znalazłem kiedyś na wyspie w pobliżu Khorinis.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //Nie sądzę, by był wiele wart, ale ktoś taki jak ty na pewno znajdzie dla niego zastosowanie.
		
	B_GiveInvItems (self, other, ItMi_Aquamarine, 1);		
	
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Farim_PaladinFisch);
};

///////////////////////////////////////////////////////////////////////
//	Info Landstreicher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Landstreicher		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Landstreicher_Condition;
	information	 = 	DIA_Addon_Farim_Landstreicher_Info;

	description	 = 	"Możesz mi coś powiedzieć o zaginionych ludziach?";
};

func int DIA_Addon_Farim_Landstreicher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info ()
{
	AI_Output (other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //Możesz mi coś powiedzieć o zaginionych ludziach?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //Mój kumpel, William, zadawał się ostatnio z podejrzanymi typkami i do czego to doprowadziło?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //Pewnego dnia nie przyszedł do pracy i od tego czasu nikt go już nie widział.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_William		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_William_Condition;
	information	 = 	DIA_Addon_Farim_William_Info;

	description	 = 	"William też zaginął?";
};

func int DIA_Addon_Farim_William_Condition ()
{
	if (SCKnowsFarimAsWilliamsFriend == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_William_15_00"); //William też zaginął?
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_01"); //Zgadza się. Był zwykłym rybakiem, choć nie da się ukryć, że czasami zdrowo mu odbijało.
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_02"); //Nie powinien był się bratać z tymi obwiesiami.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 
	
	Info_ClearChoices	(DIA_Addon_Farim_William);	
	Info_AddChoice	(DIA_Addon_Farim_William, "Co masz na myśli?", DIA_Addon_Farim_William_typen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Jestem pewien, że prędzej czy później wróci do domu.", DIA_Addon_Farim_William_auftauchen );
	Info_AddChoice	(DIA_Addon_Farim_William, "A co takiego robił?", DIA_Addon_Farim_William_WasGemacht );
	Info_AddChoice	(DIA_Addon_Farim_William, "Kiedy widziałeś go po raz ostatni?", DIA_Addon_Farim_William_WannWeg );
};
func void DIA_Addon_Farim_William_WasGemacht ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //A co takiego robił?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //William chyba kręcił jakieś lewe interesy z tymi rzezimieszkami.
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //Sądzę, że sprzedawał im jakieś nielegalne towary.
	//AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); //Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, weiß ich nicht, was er stattdessen für sie gemacht hat.
};
func void DIA_Addon_Farim_William_typen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_typen_15_00"); //Co masz na myśli?
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_01"); //Nie wiem, kim są, ani czego szukają w Khorinis.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_02"); //Wiem tylko, gdzie się spotykali z Williamem.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_03"); //Widziałem go tam tylko raz i to przypadkiem, podczas łowienia ryb.
	
	Info_AddChoice	(DIA_Addon_Farim_William, "Gdzie się spotykali?", DIA_Addon_Farim_William_Wo );
};
func void DIA_Addon_Farim_William_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //Gdzie się spotykali?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //Po przeciwnej stronie przystani, na północy, leży mała zatoka.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //Można się tam dostać wpław lub łódką.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //W zatoce znajduje się plaża, na której widziałem tych przemytników.
	self.flags = 0;	//Joly: hat seine Pflicht getan

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kolega rybaka Farima, William, zaginął. Podobno William spotykał się z jakimiś rzezimieszkami w zatoce na północ od portu."); 

	Info_AddChoice	(DIA_Addon_Farim_William, "Chyba usłyszałem już wystarczająco wiele.", DIA_Addon_Farim_William_Tschau );
};
func void DIA_Addon_Farim_William_WannWeg ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //Kiedy widziałeś go po raz ostatni?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //Nie dalej jak kilka dni temu.

	Info_AddChoice	(DIA_Addon_Farim_William, "Może po prostu wypłynął na połów?", DIA_Addon_Farim_William_Fischen );
};
func void DIA_Addon_Farim_William_Fischen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //Może po prostu wypłynął na połów?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //Niemożliwe. Jego łódź jest wciąż zacumowana na przystani.
};
func void DIA_Addon_Farim_William_auftauchen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //Jestem pewien, że prędzej czy później wróci do domu.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //Nie sądzę. Zbyt długo już go nie ma.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //Boję się, że któregoś dnia morze wyrzuci na brzeg jego ciało.
};
func void DIA_Addon_Farim_William_Tschau ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //Chyba usłyszałem już wystarczająco wiele.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //Nie przejmuj się tym. Wątpię, byś go znalazł.
	Info_ClearChoices	(DIA_Addon_Farim_William);	
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Perm		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Farim_Perm_Condition;
	information	 = 	DIA_Addon_Farim_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"I jak tam ryby? Biorą?";
};

func int DIA_Addon_Farim_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Perm_15_00"); //I jak tam ryby? Biorą?

	if (Farim_PissedOff == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_01"); //Ech, nie udawaj, że cię to interesuje!
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_02"); //Bywało lepiej. Jest jak jest. Za mało by żyć, za dużo, by umrzeć.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_WilliamReport (C_INFO)
{
	npc		 	= VLK_4301_Addon_Farim;
	nr		 	= 1;
	condition	= DIA_Addon_Farim_WilliamReport_Condition;
	information	= DIA_Addon_Farim_WilliamReport_Info;

	important 	= TRUE;
};

func int DIA_Addon_Farim_WilliamReport_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_William))
	{
		if (Npc_HasItems (other, ITWr_Addon_William_01) > 0)
		|| (Saturas_AboutWilliam == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info ()
{
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_01"); //Wróciłeś!
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_02"); //Słyszałeś coś o Williamie?
	AI_Output (other, self, "DIA_Addon_Farim_Add_15_02"); //Nie żyje.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_03"); //Spodziewałem się takich wieści.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_04"); //Dzięki, że wróciłeś, by mi to powiedzieć.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_05"); //Pójdę do knajpy i za część zdobyczy Williama wypiję za jego pamięć. Wiem, że on postąpiłby tak samo, gdybym to ja zginął.
};






