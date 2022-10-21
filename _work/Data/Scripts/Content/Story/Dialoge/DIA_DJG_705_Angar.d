///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_AngarDJG_EXIT   (C_INFO)
{
	npc         = DJG_705_Angar;
	nr          = 999;
	condition   = DIA_AngarDJG_EXIT_Condition;
	information = DIA_AngarDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_AngarDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_AngarDJG_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_HALLO		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	5;
	condition	 = 	DIA_AngarDJG_HALLO_Condition;
	information	 = 	DIA_AngarDJG_HALLO_Info;

	description	 = 	"Czy my si� przypadkiem nie znamy?";
};

func int DIA_AngarDJG_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_AngarDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_HALLO_15_00"); //Ja ci� sk�d� znam... Jeste� Cor Angar! By�e� �wi�tynnym Stra�nikiem w obozie na bagnie!
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_01"); //Nazywaj mnie po prostu Angarem. Odk�d Bractwo �ni�cego przesta�o istnie�, nie u�ywam dawnego tytu�u.
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_02"); //Dziwne, twoja twarz wygl�da znajomo, ale nie wiem, kim jeste�.
	AI_Output			(other, self, "DIA_AngarDJG_HALLO_15_03"); //Wszystko w porz�dku?
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_04"); //Ech, od jakiego� czasu nie mog� si� porz�dnie wyspa�. To przez te koszmary...
	B_LogEntry (TOPIC_Dragonhunter,"W G�rniczej Dolinie znalaz�em Angara.");
};


///////////////////////////////////////////////////////////////////////
//	B_SCTellsAngarAboutMadPsi
///////////////////////////////////////////////////////////////////////
func void B_SCTellsAngarAboutMadPsi ()
{	
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00"); //Bractwo �ni�cego pad�o ofiar� si� ciemno�ci.
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01"); //Twoi dawni kompani z obozu na bagnie snuj� si� teraz po bezdro�ach, atakuj�c wszystko, co im stanie na drodze.
		AI_Output			(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02"); //O czym ty m�wisz?!
	};
};

func void B_SCTellsAngarAboutMadPsi2 ()
{	
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00"); //Przeszli na stron� nieprzyjaciela, staj�c si� bezdusznymi narz�dziami z�a.
		AI_Output			(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01"); //Bogowie! Dlaczego by�em taki za�lepiony?! To si� ju� nigdy nie powt�rzy. Przysi�gam!
		B_GivePlayerXP (XP_Angar_KnowsMadPsi);
		Angar_KnowsMadPsi = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Wiekommstduhierher
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WIEKOMMSTDUHIERHER		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	6;
	condition	 = 	DIA_Angar_WIEKOMMSTDUHIERHER_Condition;
	information	 = 	DIA_Angar_WIEKOMMSTDUHIERHER_Info;

	description	 = 	"Jak si� tu znalaz�e�?";
};

func int DIA_Angar_WIEKOMMSTDUHIERHER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_15_00"); //Jak si� tu znalaz�e�?
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_01"); //Po upadku Bariery ukry�em si� w g�rach. Postanowi�em wreszcie co� ze sob� zrobi�.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_02"); //Przez kilka dni w��czy�em si� po okolicy, a� wreszcie obudzi�em si� w zamku. Nie pytaj mnie, co si� ze mn� dzia�o, bo nie mam poj�cia.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_03"); //Co gorsza, zgubi�em gdzie� amulet, kt�ry mia�em od lat. Zwariuj�, je�li go nie odnajd�.

	Log_CreateTopic (TOPIC_AngarsAmulett, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AngarsAmulett, LOG_RUNNING);
	B_LogEntry (TOPIC_AngarsAmulett,"Angar zgubi� sw�j amulet i pr�buje go teraz odnale��."); 


	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, DIALOG_BACK, DIA_Angar_WIEKOMMSTDUHIERHER_gehen );
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Gdzie dok�adnie zgubi�e� ten amulet?", DIA_Angar_WIEKOMMSTDUHIERHER_amulett );

	if (SC_KnowsMadPsi == TRUE)
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Bractwo �ni�cego pad�o ofiar� si� ciemno�ci.", DIA_Angar_WIEKOMMSTDUHIERHER_andere );
	}
	else
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "A co si� sta�o z pozosta�ymi cz�onkami Bractwa?", DIA_Angar_WIEKOMMSTDUHIERHER_andere );
	};

	if (DJG_Angar_SentToStones == FALSE)
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Co zamierzasz teraz robi�?", DIA_Angar_WIEKOMMSTDUHIERHER_nun );
	};
};
func void DIA_Angar_WIEKOMMSTDUHIERHER_amulett ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00"); //Gdzie dok�adnie zgubi�e� ten amulet?

	if (DJG_Angar_SentToStones ==FALSE)
	{
		AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01"); //Gdzie� na po�udniu, zanim trafi�em do zamku.
		B_LogEntry (TOPIC_AngarsAmulett,"Prawdopodobnie amulet znajduje si� gdzie� na po�udniu. Angar wybiera si� na poszukiwania zguby."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02"); //Musi by� gdzie� tutaj.
		B_LogEntry (TOPIC_AngarsAmulett,"Amulet znajduje si� w pobli�u kamiennego grobowca na po�udniu G�rniczej Doliny."); 
	};
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03"); //Podejrzewam, �e mi go ukradziono. Musz� go odzyska�!
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_andere ()
{
	if (SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi ();
	}
	else
	{
		AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00"); //A co si� sta�o z pozosta�ymi cz�onkami Bractwa?
	};
	
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01"); //Ostatnia rzecz, kt�r� pami�tam, to widok zapadaj�cej si� Bariery i towarzysz�cy mu przera�liwy, parali�uj�cy zmys�y krzyk...
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02"); //Padli�my na ziemi�, wij�c si� z b�lu, ale g�os nie milk�... stawa� si� coraz g�o�niejszy.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03"); //A� nagle nast�pi� koniec i wszyscy rozbiegli si� w ciemn� noc, wrzeszcz�c jak op�tani.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04"); //Nigdy ju� ich nie zobaczy�em.
	
	if (SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi2 ();
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_nun ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00"); //Co zamierzasz robi� dalej?
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01"); //Najpierw troch� odpoczn�. Potem poszukam mojego amuletu.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02"); //S�ysza�em jakie� plotki o smokach.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03"); //Ludzie m�wi�, �e wojownicy przybywaj� do G�rniczej Doliny, by z nimi walczy�.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04"); //Mo�e si� do nich przy��cz�?

	Angar_willDJGwerden = TRUE;

};

func void DIA_Angar_WIEKOMMSTDUHIERHER_gehen ()
{
	Info_ClearChoices	(DIA_Angar_WIEKOMMSTDUHIERHER);
};

///////////////////////////////////////////////////////////////////////
//	Info SCTellsAngarAboutMadPsi2
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_SCTellsAngarAboutMadPsi2		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	7;
	condition	 = 	DIA_Angar_SCTellsAngarAboutMadPsi2_Condition;
	information	 = 	DIA_Angar_SCTellsAngarAboutMadPsi2_Info;

	description	 = 	"Bractwo �ni�cego pad�o ofiar� si� ciemno�ci."; //Joly: falls erst nach DIA_Angar_WIEKOMMSTDUHIERHER  (SC_KnowsMadPsi == TRUE)
};

func int DIA_Angar_SCTellsAngarAboutMadPsi2_Condition ()
{
	if (SC_KnowsMadPsi == TRUE)
	&& (Angar_KnowsMadPsi == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		{
				return TRUE;
		};
};

func void DIA_Angar_SCTellsAngarAboutMadPsi2_Info ()
{
	B_SCTellsAngarAboutMadPsi ();
	B_SCTellsAngarAboutMadPsi2 ();
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAmulett
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_FOUNDAMULETT		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	7;
	condition	 = 	DIA_Angar_FOUNDAMULETT_Condition;
	information	 = 	DIA_Angar_FOUNDAMULETT_Info;

	description	 = 	"Znalaz�em tw�j amulet.";
};

func int DIA_Angar_FOUNDAMULETT_Condition ()
{
	if 	(Npc_HasItems (other,ItAm_Mana_Angar_MIS))
		&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		{
				return TRUE;
		};
};

func void B_AngarsAmulettAbgeben()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_15_00"); //Znalaz�em tw�j amulet.
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_04_01"); //Dzi�ki! Ju� straci�em nadziej�, �e go jeszcze zobacz�!

	B_GiveInvItems (other, self, ItAm_Mana_Angar_MIS,1);
	
	DJG_AngarGotAmulett = TRUE;
	B_GivePlayerXP (XP_AngarDJGUndeadMage); 
};

func void DIA_Angar_FOUNDAMULETT_Info ()
{
	B_AngarsAmulettAbgeben ();

	Info_AddChoice	(DIA_Angar_FOUNDAMULETT, "Dlaczego tak bardzo ci na nim zale�y?", DIA_Angar_FOUNDAMULETT_besonders );
	Info_AddChoice	(DIA_Angar_FOUNDAMULETT, "Co zamierzasz teraz zrobi�?", DIA_Angar_FOUNDAMULETT_nun );
};

func void DIA_Angar_FOUNDAMULETT_besonders ()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_00"); //Dlaczego tak bardzo ci na nim zale�y?
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_besonders_04_01"); //Dosta�em go w prezencie...
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_02"); //Rozumiem.


};

func void DIA_Angar_FOUNDAMULETT_nun ()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_nun_15_00"); //Co zamierzasz robi� dalej?
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_01"); //Wynie�� si� z tej przekl�tej doliny!
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_02"); //Kto wie - mo�e si� jeszcze kiedy� spotkamy. Bywaj!

	AI_StopProcessInfos (self);
	if 	((Npc_GetDistToWP(self,"OC_TO_MAGE")<1000) == FALSE) //Joly: Damit Angar nicht am OC Tor rumkronkelt, wenn er noch im OC ist.
	{ 
		Npc_ExchangeRoutine	(self,"LeavingOW");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DJG_Anwerben
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DJG_ANWERBEN		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	8;
	condition	 = 	DIA_Angar_DJG_ANWERBEN_Condition;
	information	 = 	DIA_Angar_DJG_ANWERBEN_Info;

	description	 = 	"Mo�e m�g�bym ci jako� pom�c?";
};

func int DIA_Angar_DJG_ANWERBEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Angar_DJG_ANWERBEN_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_15_00"); //Mo�e m�g�bym ci jako� pom�c?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_04_01"); //Czemu nie. �adna pomoc nie zaszkodzi.


	if (DJG_Angar_SentToStones == FALSE)
		{
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "Musz� ju� i��.", DIA_Angar_DJG_ANWERBEN_gehen );
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "A gdzie zamierzasz szuka�?", DIA_Angar_DJG_ANWERBEN_wo );
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "Kiedy zamierzasz wyruszy�?", DIA_Angar_DJG_ANWERBEN_wann );
		};
	
	if (Angar_willDJGwerden == TRUE)
		{
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "A co z �owcami smok�w?", DIA_Angar_DJG_ANWERBEN_DJG );
		};
};
func void DIA_Angar_DJG_ANWERBEN_DJG ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_DJG_15_00"); //A co z �owcami smok�w?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_DJG_04_01"); //Porozmawiam z nimi p�niej. Mo�e przyda im si� kto� taki jak ja.

};

func void DIA_Angar_DJG_ANWERBEN_wann ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_wann_15_00"); //Kiedy zamierzasz wyruszy�?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wann_04_01"); //Jak tylko odzyskam si�y.
};

func void DIA_Angar_DJG_ANWERBEN_wo ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_wo_15_00"); //A gdzie zamierzasz szuka�?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wo_04_01"); //P�jd� na po�udnie, tam, sk�d przyby�em.
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wo_04_02"); //Jest tam pewna jaskinia otoczona g�azami, a w niej grobowiec...

};
func void DIA_Angar_DJG_ANWERBEN_gehen ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_gehen_15_00"); //Musz� ju� i��.
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_gehen_04_01"); //Uwa�aj na siebie.
	
	AI_StopProcessInfos (self);
};




///////////////////////////////////////////////////////////////////////
//	Info Wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WASMACHSTDU		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	9;
	condition	 = 	DIA_AngarDJG_WASMACHSTDU_Condition;
	information	 = 	DIA_AngarDJG_WASMACHSTDU_Info;

	description	 = 	"Co� nie tak?";
};

func int DIA_AngarDJG_WASMACHSTDU_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01")<8000) 
		&&	(Npc_KnowsInfo(other, DIA_Angar_DJG_ANWERBEN)) 
		&& (DJG_AngarGotAmulett == FALSE)
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_15_00"); //Co� nie tak?
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_01"); //S�yszysz to? Nigdy w �yciu nie s�ysza�em czego� tak przera�aj�cego.
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_15_02"); //Nie wiem, o czym m�wisz! Ja nic nie s�ysz�.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_03"); //Wszystko tu cuchnie �mierci� i zniszczeniem. Wej�cia do tej krypty strzeg� odra�aj�ce istoty.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_04"); //To kryj�wka mrocznej, z�owrogiej si�y, kt�rej poddani nawiedzaj� nasz �wiat.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_05"); //Jestem prawie pewien, �e m�j amulet jest gdzie� tutaj.

	if (Angar_willDJGwerden == TRUE)
	{
	Info_AddChoice	(DIA_AngarDJG_WASMACHSTDU, "Rozmawia�e� ju� z �owcami smok�w?", DIA_AngarDJG_WASMACHSTDU_DJG );
	};
};
func void DIA_AngarDJG_WASMACHSTDU_DJG ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_DJG_15_00"); //Rozmawia�e� ju� z �owcami smok�w?
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_01"); //Tak, ale spodziewa�em si� towarzystwa na kszta�t mojego dawnego Bractwa.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_02"); //Tymczasem ci �owcy to dzika zgraja bezm�zgich osi�k�w. To nie dla mnie.
};


///////////////////////////////////////////////////////////////////////
//	Info WhatsInThere
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WHATSINTHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	10;
	condition	 = 	DIA_AngarDJG_WHATSINTHERE_Condition;
	information	 = 	DIA_AngarDJG_WHATSINTHERE_Info;

	description	 = 	"Co si� kryje w tej jaskini za ska�ami?";
};

func int DIA_AngarDJG_WHATSINTHERE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_WASMACHSTDU))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_AngarDJG_WHATSINTHERE_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WHATSINTHERE_15_00"); //Co si� kryje w tej jaskini za ska�ami?
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_01"); //Co� nie pozwala mi zbli�y� si� do wej�cia!
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_02"); //Jaskini strze�e magiczna istota. Widzia�em j� w nocy, jak przeczesywa�a okolic�. To straszne... odra�aj�ce stworzenie.
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_03"); //Sunie w t� i z powrotem, mi�dzy drzewami, i wydaje si�, �e wysysa �ycie ze wszystkiego, do czego si� zbli�y.

	//Log_AddEntry (TOPIC_Dragonhunter,"Ich habe Angar im Minental gefunden. Er vermutet, da� sich in der Felsengruft, wo er sich aufh�lt, ein Drache befindet, der hier seine untoten Helfer an die Oberfl�che entsendet.");
	B_LogEntry (TOPIC_Dragonhunter,"W G�rniczej Dolinie znalaz�em Angara.");
};

///////////////////////////////////////////////////////////////////////
//	Info WantToGoInThere
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WANTTOGOINTHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	11;
	condition	 = 	DIA_AngarDJG_WANTTOGOINTHERE_Condition;
	information	 = 	DIA_AngarDJG_WANTTOGOINTHERE_Info;

	description	 = 	"Chod�my dalej.";
};

func int DIA_AngarDJG_WANTTOGOINTHERE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_WHATSINTHERE))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_AngarDJG_WANTTOGOINTHERE_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WANTTOGOINTHERE_15_00"); //Chod�my dalej.
	AI_Output			(self, other, "DIA_AngarDJG_WANTTOGOINTHERE_04_01"); //Spr�buj�. Ale b�d�my ostro�ni.

	AI_StopProcessInfos (self);  

	if (Npc_IsDead(SkeletonMage_Angar))
	{
		Npc_ExchangeRoutine	(self,"Zwischenstop"); 
	}
	else
	{
		Npc_ExchangeRoutine	(self,"Angriff");
		DJG_AngarAngriff = TRUE; 
	};
		self.aivar[AIV_PARTYMEMBER] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadMageDead
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_UndeadMageDead		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	13;
	condition	 = 	DIA_AngarDJG_UndeadMageDead_Condition;
	information	 = 	DIA_AngarDJG_UndeadMageDead_Info;
	important	 = 	TRUE;
};

func int DIA_AngarDJG_UndeadMageDead_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02")<1000) 
		&& (DJG_AngarAngriff == TRUE)
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_UndeadMageDead_Info ()
{
	AI_Output			(self, other, "DIA_AngarDJG_UndeadMageDead_04_00"); //Tylko... �mier� i zniszczenie. Musz� si� st�d wydosta�!
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"RunToEntrance");
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadMageComes
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_UNDEADMAGECOMES		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	13;
	condition	 = 	DIA_AngarDJG_UNDEADMAGECOMES_Condition;
	information	 = 	DIA_AngarDJG_UNDEADMAGECOMES_Info;
	important	 = 	TRUE;
};

func int DIA_AngarDJG_UNDEADMAGECOMES_Condition ()
{
		
	if 	(
		(Npc_GetDistToWP(self,"OW_PATH_3_13")<500) 				
		&&	(Npc_KnowsInfo(other, DIA_AngarDJG_WANTTOGOINTHERE))
		&& ((Npc_KnowsInfo(other, DIA_AngarDJG_UndeadMageDead))==FALSE)
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_UNDEADMAGECOMES_Info ()
{
	AI_Output			(self, other, "DIA_AngarDJG_UNDEADMAGECOMES_04_00"); //Ciii... Teraz... S�yszysz?
	
	AI_StopProcessInfos (self);   
 	
 	Npc_ExchangeRoutine	(self,"GotoStonehendgeEntrance"); 

};

///////////////////////////////////////////////////////////////////////
//	Info Wasistlos
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WASISTLOS		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	14;
	condition	 = 	DIA_Angar_WASISTLOS_Condition;
	information	 = 	DIA_Angar_WASISTLOS_Info;

	description	 = 	"Co� nie tak?";
};

func int DIA_Angar_WASISTLOS_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_PATH_3_STONES")<1000) 				
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)	
			{
					return TRUE;
			};
};

func void DIA_Angar_WASISTLOS_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WASISTLOS_15_00"); //Co si� sta�o?
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_01"); //Nie mog� i�� z tob� dalej.
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_02"); //Co� mi m�wi, �e nie wyjd� z tego �ywy.
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_03"); //Nie potrafi� tego wyt�umaczy�, ale...
	
	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_04"); //Musz� czym pr�dzej opu�ci� to przekl�te miejsce, zanim podziel� los moich dawnych kompan�w.
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_05"); //Za ka�dym razem, gdy stawiam czo�a tym... upiorom... czuj� si�, jakbym walczy� z w�asnymi bra�mi.
	};

	AI_StopProcessInfos (self);

	B_LogEntry (TOPIC_Dragonhunter,"Angar odszed�. Przez tych wszystkich o�ywie�c�w mia� wra�enie, jakby walczy� ze swoimi w�asnymi lud�mi.");
			
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"LeavingOW");
};

///////////////////////////////////////////////////////////////////////
//	Info Whyareyouhere
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WHYAREYOUHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 15;
	condition	 = 	DIA_Angar_WHYAREYOUHERE_Condition;
	information	 = 	DIA_Angar_WHYAREYOUHERE_Info;

	description	 = 	"Angar? Co ty tu robisz?";
};

func int DIA_Angar_WHYAREYOUHERE_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_CAVALORN_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_Angar_WHYAREYOUHERE_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WHYAREYOUHERE_15_00"); //Angar? Co ty tu robisz?
	AI_Output			(self, other, "DIA_Angar_WHYAREYOUHERE_04_01"); //By�em w drodze na prze��cz, gdy nagle natkn��em si� na band� ork�w. Ju� my�la�em, �e si� nie wywin�!
	AI_Output			(self, other, "DIA_Angar_WHYAREYOUHERE_04_02"); //Odczekam troch� i spr�buj� znowu. Zobaczymy si� po drugiej stronie!

	B_LogEntry (TOPIC_Dragonhunter,"Znowu spotka�em Angara. Utkn�� w G�rniczej Dolinie na dobre.");
	B_GivePlayerXP (XP_AngarDJGAgain); 
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info PermKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_PERMKAP4		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	condition	 = 	DIA_Angar_PERMKAP4_Condition;
	information	 = 	DIA_Angar_PERMKAP4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nie lubi� zostawia� ci� bez towarzystwa.";
};

func int DIA_Angar_PERMKAP4_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Angar_WHYAREYOUHERE))
		{
				return TRUE;
		};
};

func void DIA_Angar_PERMKAP4_Info ()
{
	AI_Output			(other, self, "DIA_Angar_PERMKAP4_15_00"); //Mo�esz tu zaczeka�?
	AI_Output			(self, other, "DIA_Angar_PERMKAP4_04_01"); //Oczywi�cie. Ruszaj �mia�o.

	AI_StopProcessInfos (self);	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Angar_PICKPOCKET (C_INFO)
{
	npc			= DJG_705_Angar;
	nr			= 900;
	condition	= DIA_Angar_PICKPOCKET_Condition;
	information	= DIA_Angar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Angar_PICKPOCKET_Condition()
{
	C_Beklauen (47, 55);
};
 
FUNC VOID DIA_Angar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Angar_PICKPOCKET);
	Info_AddChoice		(DIA_Angar_PICKPOCKET, DIALOG_BACK 		,DIA_Angar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Angar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Angar_PICKPOCKET_DoIt);
};

func void DIA_Angar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Angar_PICKPOCKET);
};
	
func void DIA_Angar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Angar_PICKPOCKET);
};

















































