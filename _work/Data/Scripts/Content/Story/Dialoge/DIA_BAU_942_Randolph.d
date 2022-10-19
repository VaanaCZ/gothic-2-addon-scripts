///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Randolph_EXIT   (C_INFO)
{
	npc         = BAU_942_Randolph;
	nr          = 999;
	condition   = DIA_Randolph_EXIT_Condition;
	information = DIA_Randolph_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Randolph_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Randolph_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchwereLuft
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_SchwereLuft		(C_INFO)
{
	npc			 = 	BAU_942_Randolph;
	nr			 = 	4;
	condition	 = 	DIA_Randolph_SchwereLuft_Condition;
	information	 = 	DIA_Randolph_SchwereLuft_Info;
	permanent  	 =  FALSE;
	description	 = 	"Wszystko w porz�dku?";
};
func int DIA_Randolph_SchwereLuft_Condition ()
{	
	if  !(Npc_IsDead (Alvares))
	&&  !(Npc_IsDead (Engardo))
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};
func void DIA_Randolph_SchwereLuft_Info ()
{
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_00"); //Wszystko w porz�dku?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_01"); //Hmmm... Jedno z�e s�owo, a rozp�ta si� tu prawdziwe piek�o... Uwa�aj, bo b�dzie jatka.
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_02"); //Czy przy��czysz si� do walki?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_03"); //Nie b�d� sta� jak idiota i przygl�da� si�, ale te� nie zamierzam nikogo prowokowa�.
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Farmie Akila zagra�aj� najemnicy."); 
	B_NpcClearObsessionByDMT (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_HALLO		(C_INFO)
{
	npc			 = 	BAU_942_Randolph;
	nr			 = 	4;
	condition	 = 	DIA_Randolph_HALLO_Condition;
	information	 = 	DIA_Randolph_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Wszystko w porz�dku?";
};

func int DIA_Randolph_HALLO_Condition ()
{	
	if  (Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};
func void DIA_Randolph_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Randolph_HALLO_15_00"); //Wszystko w porz�dku?
	
	if Npc_IsDead (Akil)
	&& Npc_IsDead (Kati)
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_01"); //Skoro Kati i Akil udali si� do �wiata Innosa, teraz ja b�d� zajmowa� si� farm�.
		
		Npc_ExchangeRoutine (self,"START");
		AI_ContinueRoutine  (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_02"); //Tak, w porz�dku. Ten Alvares ostatnio pozwala� sobie na zbyt wiele. Na szcz�cie ju� po wszystkim.
	};
	AI_Output (self, other, "DIA_Randolph_HALLO_06_03"); //Przyda�oby si� porz�dnie przep�uka� gard�o w gospodzie.
};

///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_Baltram		(C_INFO)
{
	npc			 = 	BAU_942_Randolph;
	nr			 = 	5;
	condition	 = 	DIA_Randolph_Baltram_Condition;
	information	 = 	DIA_Randolph_Baltram_Info;
	permanent  	 =  FALSE;
	description	 = 	"Baltram mnie przys�a�...";
};

func int DIA_Randolph_Baltram_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Randolph_HALLO))
	&&  (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	&& 	Npc_IsDead (Akil)
	&& 	Npc_IsDead (Kati)
	&&  (Lieferung_Geholt == FALSE)
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Randolph_Baltram_Info ()
{
	AI_Output (other, self, "DIA_Randolph_Baltram_15_00"); //Przysy�a mnie Baltram, mam odebra� dla niego dostaw�.
	AI_Output (self, other, "DIA_Randolph_Baltram_06_01"); //�wietnie. Wszystko ju� przygotowa�em. Oto paczka dla ciebie.
	CreateInvItems 	(self, ItMi_BaltramPaket, 1 );
	B_GiveInvItems (self, other, ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Geschichte 
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_Geschichte		(C_INFO)
{
	npc			 = 	BAU_942_Randolph;
	nr			 = 	5;
	condition	 = 	DIA_Randolph_Geschichte_Condition;
	information	 = 	DIA_Randolph_Geschichte_Info;
	permanent	 =  FALSE;
	description	 = 	"Nie jeste� st�d, prawda?";
};

func int DIA_Randolph_Geschichte_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Randolph_HALLO))
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Randolph_Geschichte_Info ()
{
	AI_Output (other, self, "DIA_Randolph_Geschichte_15_00"); //Nie jeste� st�d, prawda?
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_01"); //Przybywam z po�udniowych wysp. Swego czasu Khorinis potrzebowa�o ludzi do wydobywania magicznej rudy.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_02"); //Kiedy jednak przyby�em na miejsce, okaza�o si�, �e maj� tu wielk�, magiczn� Barier�. Nie mia�em zamiaru jej przekracza�. Znalaz�em wi�c prac� w porcie.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_03"); //Kiedy port przesta� przyjmowa� statki, postanowi�em zmieni� prac�. Tak trafi�em do Akila. Prawd� powiedziawszy, ima�em si� ju� gorszych zaj��.
};
/*
	Du kommst nicht aus der Gegend, richtig? 
	Ich komme von den s�dlichen Inseln. Irgendwann hie� es, sie br�uchten Leute in Khorinis, wegen dem magischen Erz. 
	Aber als ich ankam war da diese riesige Barriere. Und da wollte ich nicht rein. Ich hab dann angefangen im Hafen zu arbeiten. 
	Und seitdem keine Schiffe mehr kommen, bin ich halt zu Akil gegangen. Naja, ich hab schon schlechtere Jobs gemacht.  
	
	
	Hey, ich kenne da noch jemanden, der dir ein paar Sachen besorgen kann. 
	Ein Freund, der mit mir zusammen aus dem S�den gekommen ist. 
	Aber ich brauche 10 Goldm�nzen, um beim Wett - Trinken in der Taverne mitzumachen.  
	Also wenn du die Info willst, dann gib mir das Gold. 
	
//Wenn du die Taverne suchst dann geh einfach �ber die Br�cke und folge dem Weg, dann kommst direkt daran vorbei.
*/
///////////////////////////////////////////////////////////////////////
//	Info Taverne
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_TAVERNE		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	5;
	condition	 = 	DIA_Randolph_TAVERNE_Condition;
	information	 = 	DIA_Randolph_TAVERNE_Info;

	description	 = 	"Bywasz w gospodzie?";
};

func int DIA_Randolph_TAVERNE_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Randolph_HALLO))
	&& (Kapitel < 4)
			{
					return TRUE;
			};
};

func void DIA_Randolph_TAVERNE_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_TAVERNE_15_00"); //Bywasz w gospodzie?
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_01"); //To prawda. Cho� ostatnio coraz rzadziej.
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_02"); //Nie sta� mnie na przesiadywanie tam.
};

///////////////////////////////////////////////////////////////////////
//	Info WasistinTaverne
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_WASISTINTAVERNE		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	6;
	condition	 = 	DIA_Randolph_WASISTINTAVERNE_Condition;
	information	 = 	DIA_Randolph_WASISTINTAVERNE_Info;

	description	 = 	"Co tak dok�adnie dzieje si� w gospodzie?";
};

func int DIA_Randolph_WASISTINTAVERNE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Randolph_TAVERNE))
	&& (Kapitel < 4)
		{
				return TRUE;
		};
};

func void DIA_Randolph_WASISTINTAVERNE_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_WASISTINTAVERNE_15_00"); //Co tak dok�adnie dzieje si� w gospodzie?
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_01"); //Najpro�ciej m�wi�c, kwitnie tam hazard.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_02"); //Dw�ch go�ci konkuruje w piciu piwa. Wygrywa ten, kt�ry d�u�ej utrzyma si� na nogach.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_03"); //Przegra�em w tej konkurencji. Zanim tam wr�c�, musz� troch� zarobi�.
	Log_CreateTopic (TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry (TOPIC_Wettsaufen,"W gospodzie s� przyjmowane zak�ady."); 

};

///////////////////////////////////////////////////////////////////////
//	Info GegenWen
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_GEGENWEN		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	7;
	condition	 = 	DIA_Randolph_GEGENWEN_Condition;
	information	 = 	DIA_Randolph_GEGENWEN_Info;

	description	 = 	"Kto by� twoim przeciwnikiem?";
};

func int DIA_Randolph_GEGENWEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Randolph_WASISTINTAVERNE))
	&& (Kapitel < 4)
		{
				return TRUE;
		};
};

func void DIA_Randolph_GEGENWEN_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_GEGENWEN_15_00"); //Kto by� twoim przeciwnikiem?
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_01"); //Ten stary hultaj - Rukhar. Jak dot�d nie uda�o mi si� go pokona�.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_02"); //Co� mi si� jednak zdaje, �e ten �mierdz�cy patafian za ka�dym razem doprawia� moje piwo ginem.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_03"); //Wydaje mi si�, �e ta brudna kanalia trzyma gin w tym swoim kufrze!
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_04"); //Kto� powinien podmieni� gin na wod�. Wtedy mo�e sobie doprawia� moje piwo, jak d�ugo zechce.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_05"); //Gdybym tylko mia� troch� z�ota, by raz jeszcze stan�� z nim do pojedynku...

	B_LogEntry (TOPIC_Wettsaufen,"Randolph opowiedzia� mi o Rukharze i konkursie picia. Randolph nie ma ju� pieni�dzy, aby stan�� przeciwko Rukharowi."); 
	B_LogEntry (TOPIC_Wettsaufen,"Randolph podejrzewa, �e Rukhar oszukuje podczas zawod�w w piciu. Prosi mnie, abym zamieni� butelk� ginu, kt�r� Rukhar trzyma w swoim kufrze, na butelk� wody."); 
};

///////////////////////////////////////////////////////////////////////
//	Info WasBrauchstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_WASBRAUCHSTDU		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	8;
	condition	 = 	DIA_Randolph_WASBRAUCHSTDU_Condition;
	information	 = 	DIA_Randolph_WASBRAUCHSTDU_Info;

	description	 = 	"Ile pieni�dzy potrzebujesz, by wzi�� udzia� w konkursie?";
};

func int DIA_Randolph_WASBRAUCHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Randolph_GEGENWEN))
	&& (MIS_Rukhar_Wettkampf == LOG_RUNNING)
	&& (Kapitel < 4)
		{
				return TRUE;
		};
};

func void DIA_Randolph_WASBRAUCHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_WASBRAUCHSTDU_15_00"); //Ile pieni�dzy potrzebujesz, by wzi�� udzia� w konkursie?
	AI_Output			(self, other, "DIA_Randolph_WASBRAUCHSTDU_06_01"); //10 sztuk z�ota.
};

///////////////////////////////////////////////////////////////////////
//	Info IchgebedirGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_ICHGEBEDIRGELD		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	9;
	condition	 = 	DIA_Randolph_ICHGEBEDIRGELD_Condition;
	information	 = 	DIA_Randolph_ICHGEBEDIRGELD_Info;
	permanent	 =  TRUE;

	description	 = 	"Dam ci pieni�dze, by� m�g� stan�� w szranki z Rukharem.";
};

var int DIA_Randolph_ICHGEBEDIRGELD_noPerm;

func int DIA_Randolph_ICHGEBEDIRGELD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Randolph_WASBRAUCHSTDU))
	&& (DIA_Randolph_ICHGEBEDIRGELD_noPerm == FALSE)
	&& (Kapitel < 4)
			{
					return TRUE;
			};
};

func void DIA_Randolph_ICHGEBEDIRGELD_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_ICHGEBEDIRGELD_15_00"); //Dam ci pieni�dze, by� m�g� stan�� w szranki z Rukharem.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
		{
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_01"); //Naprawd�? Serdecznie dzi�kuj�. Wkr�tce je oddam.
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_02"); //Je�li wygram, dorzuc� nawet co� ekstra.
		
			B_LogEntry (TOPIC_Wettsaufen,"Powinienem wybra� si� na zawody w piciu piwa."); 
			B_GivePlayerXP (XP_Randolph_WettkampfStart);
		
			DIA_Randolph_ICHGEBEDIRGELD_noPerm = TRUE;
			
			B_NpcClearObsessionByDMT (self);
			
			MIS_Rukhar_Wettkampf_Day = Wld_GetDay(); 
			
			Npc_ExchangeRoutine	(self,"Wettkampf"); 
			B_StartOtherRoutine	(Orlan,"Wettkampf");
			B_StartOtherRoutine	(Rukhar,"Wettkampf");
		}
		else
		{
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_03"); //Nie trzeba, sam ledwie wi��esz koniec z ko�cem.
		};
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WettkampfZuende
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_WETTKAMPFZUENDE		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	10;
	condition	 = 	DIA_Randolph_WETTKAMPFZUENDE_Condition;
	information	 = 	DIA_Randolph_WETTKAMPFZUENDE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mamy kaca?";
};

func int DIA_Randolph_WETTKAMPFZUENDE_Condition ()
{
	if (MIS_Rukhar_Wettkampf == LOG_SUCCESS)
	&& (Kapitel < 4)
		{
				return TRUE;
		};
};
VAR int DIA_Randolph_WETTKAMPFZUENDE_OneTime;
func void DIA_Randolph_WETTKAMPFZUENDE_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_WETTKAMPFZUENDE_15_00"); //Mamy kaca?
	
	
	if (Rukhar_Won_Wettkampf == TRUE)
		{
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_01"); //Chyba nawet par� kac�w na raz... Ju� nigdy nie dotkn� alkoholu.
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_02"); //Twoje pieni�dze przepad�y. Przykro mi.
		}
	else
		{
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_03"); //Nie. Czuj� si� �wietnie.
		
			if (DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE)
			{
				AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_04"); //W ko�cu si� uda�o. Wielkie dzi�ki za po�yczk�. Prosz�, przyjmij to w podzi�ce.
				CreateInvItems (self, ItMi_Gold, 20);									
				B_GiveInvItems (self, other, ItMi_Gold, 12);
				DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;					
			};
			
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_05"); //Wygl�da na to, �e Rukhar d�uugo jeszcze b�dzie trze�wia�.
		};

	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_PERM		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	30;
	condition	 = 	DIA_Randolph_PERM_Condition;
	information	 = 	DIA_Randolph_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Oszala�e�?";
};

func int DIA_Randolph_PERM_Condition ()
{
	if (Kapitel >= 4)
	&& (NpcObsessedByDMT_Randolph == FALSE)
		{
				return TRUE;
		};
};

var int DIA_Randolph_PERM_GotMoney;

func void DIA_Randolph_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
		{
			B_NpcObsessedByDMT (self);
		}
	else
		{
			AI_Output			(other, self, "DIA_Randolph_PERM_15_00"); //Wszystko w porz�dku?

			if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			&& (MIS_HealRandolph != LOG_SUCCESS)
				{
					if (DIA_Sagitta_HEALRANDOLPH_GotOne == FALSE)
					&& (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == TRUE)
					&& (DIA_Randolph_PERM_GotMoney == FALSE)
					{
						AI_Output			(other, self, "DIA_Randolph_PERM_15_01"); //Wysy�asz mnie bez grosza przy duszy i nawet nie raczysz uprzedzi�, �e to cholerstwo tyle kosztuje?
						AI_Output			(other, self, "DIA_Randolph_PERM_15_02"); //Sagitta ��da ode mnie 300 sztuk z�ota.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_03"); //Nie dam ci wi�cej ni� 150 sztuk z�ota. Prosz�, musisz mi pom�c, b�agam.
						CreateInvItems (self, ItMi_Gold, 150);									
						B_GiveInvItems (self, other, ItMi_Gold, 150);					
						DIA_Randolph_PERM_GotMoney = TRUE;
					}
					else
					{
						AI_Output			(self, other, "DIA_Randolph_PERM_06_04"); //Czuj� si� potwornie. Od kiedy przesta�em pi�, wszystko mnie boli. Napraw� potrzebuj� pomocy.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_05"); //Jest pewne lekarstwo, kt�re powinno pom�c.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_06"); //Sagitta, stara zielarka, zwykle je dla mnie przygotowuje. Ale nie mog� ryzykowa� wyprawy do niej, kiedy bandy ork�w grasuj� po okolicy.
					};
					Log_CreateTopic (TOPIC_HealRandolph, LOG_MISSION);
					Log_SetTopicStatus(TOPIC_HealRandolph, LOG_RUNNING);
					B_LogEntry (TOPIC_HealRandolph,"Randolph twierdzi, �e przesta� pi� alkohol, i prosi mnie o przyniesienie od zielarki Sagitty jakich� zi�, kt�re pomog� mu przetrwa� pierwsze ci�kie dni trze�wo�ci."); 

					MIS_HealRandolph = LOG_RUNNING;
				}
			else
				{
					AI_Output			(self, other, "DIA_Randolph_PERM_06_07"); //Ci�gle jeszcze kr�ci mi si� w g�owie, ale og�lnie jest o wiele lepiej.
				};	
		};	
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_Heilung		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	55;
	condition	 = 	DIA_Randolph_Heilung_Condition;
	information	 = 	DIA_Randolph_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Alkohol uderzy� do g��wki, co?";
};

func int DIA_Randolph_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Randolph == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	 {
				return TRUE;
	 };
};

func void DIA_Randolph_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_Heilung_15_00"); //Alkohol uderzy� do g��wki, co?
	AI_Output			(self, other, "DIA_Randolph_Heilung_06_01"); //Ju� nigdy ani kropelki. Nigdy w �yciu. S�owo honoru.
	B_NpcClearObsessionByDMT (self);
};


///////////////////////////////////////////////////////////////////////
//	Info SagittaHeal
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_SAGITTAHEAL		(C_INFO)
{
	npc		 = 	BAU_942_Randolph;
	nr		 = 	56;
	condition	 = 	DIA_Randolph_SAGITTAHEAL_Condition;
	information	 = 	DIA_Randolph_SAGITTAHEAL_Info;

	description	 = 	"Prosz�, to powinno z�agodzi� objawy odstawienia trunk�w.";
};

func int DIA_Randolph_SAGITTAHEAL_Condition ()
{
	if (MIS_HealRandolph == LOG_RUNNING)
	&& (Npc_HasItems (other,ItPo_HealRandolph_MIS))
		{
				return TRUE;
		};
};

func void DIA_Randolph_SAGITTAHEAL_Info ()
{
	AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_00"); //Prosz�, to powinno z�agodzi� objawy odstawienia trunk�w.
	B_GiveInvItems 		(other, self, ItPo_HealRandolph_MIS, 1);					
	
	if (Npc_IsInState (self,ZS_Pick_FP))
		{
			B_UseItem 			(self,ItPo_HealRandolph_MIS);
		};	
		
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_01"); //Och! Dzi�ki, stary. Nareszcie troch� odpoczn�.
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_02"); //Jak ja ci si� odwdzi�cz�?
	
	if (DIA_Randolph_PERM_GotMoney == FALSE)
		{
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_03"); //Te kilka monet to niewiele, wiem. Ale to ostatnie pieni�dze, jakie mi zosta�y.
		
			CreateInvItems (self, ItMi_Gold, 150);									
			B_GiveInvItems (self, other, ItMi_Gold, 150);					
		}
	else
		{
			AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_04"); //Zap�aci�em za ciebie kup� kasy, a ty dajesz mi kilka �mierdz�cych monet? To nawet nie pokryje moich wydatk�w.
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_05"); //Mog� si� chyba uzna� za szcz�liwca. Niecz�sto spotyka si� tak pomocnych paladyn�w. Nie s�dzisz?
			
		};
	
	MIS_HealRandolph = LOG_SUCCESS;
	B_GivePlayerXP (XP_HealRandolph);
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Randolph_PICKPOCKET (C_INFO)
{
	npc			= BAU_942_Randolph;
	nr			= 900;
	condition	= DIA_Randolph_PICKPOCKET_Condition;
	information	= DIA_Randolph_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Randolph_PICKPOCKET_Condition()
{
	C_Beklauen (58, 2);	//Joly: darf nicht Gold mehr haben!
};
 
FUNC VOID DIA_Randolph_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Randolph_PICKPOCKET);
	Info_AddChoice		(DIA_Randolph_PICKPOCKET, DIALOG_BACK 		,DIA_Randolph_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Randolph_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Randolph_PICKPOCKET_DoIt);
};

func void DIA_Randolph_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Randolph_PICKPOCKET);
};
	
func void DIA_Randolph_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Randolph_PICKPOCKET);
};






