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
	description	 = 	"Wszystko w porz¹dku?";
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
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_00"); //Wszystko w porz¹dku?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_01"); //Hmmm... Jedno z³e s³owo, a rozpêta siê tu prawdziwe piek³o... Uwa¿aj, bo bêdzie jatka.
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_02"); //Czy przy³¹czysz siê do walki?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_03"); //Nie bêdê sta³ jak idiota i przygl¹da³ siê, ale te¿ nie zamierzam nikogo prowokowaæ.
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Farmie Akila zagra¿aj¹ najemnicy."); 
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
	description	 = 	"Wszystko w porz¹dku?";
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
	AI_Output (other, self, "DIA_Randolph_HALLO_15_00"); //Wszystko w porz¹dku?
	
	if Npc_IsDead (Akil)
	&& Npc_IsDead (Kati)
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_01"); //Skoro Kati i Akil udali siê do œwiata Innosa, teraz ja bêdê zajmowa³ siê farm¹.
		
		Npc_ExchangeRoutine (self,"START");
		AI_ContinueRoutine  (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_02"); //Tak, w porz¹dku. Ten Alvares ostatnio pozwala³ sobie na zbyt wiele. Na szczêœcie ju¿ po wszystkim.
	};
	AI_Output (self, other, "DIA_Randolph_HALLO_06_03"); //Przyda³oby siê porz¹dnie przep³ukaæ gard³o w gospodzie.
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
	description	 = 	"Baltram mnie przys³a³...";
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
	AI_Output (other, self, "DIA_Randolph_Baltram_15_00"); //Przysy³a mnie Baltram, mam odebraæ dla niego dostawê.
	AI_Output (self, other, "DIA_Randolph_Baltram_06_01"); //Œwietnie. Wszystko ju¿ przygotowa³em. Oto paczka dla ciebie.
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
	description	 = 	"Nie jesteœ st¹d, prawda?";
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
	AI_Output (other, self, "DIA_Randolph_Geschichte_15_00"); //Nie jesteœ st¹d, prawda?
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_01"); //Przybywam z po³udniowych wysp. Swego czasu Khorinis potrzebowa³o ludzi do wydobywania magicznej rudy.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_02"); //Kiedy jednak przyby³em na miejsce, okaza³o siê, ¿e maj¹ tu wielk¹, magiczn¹ Barierê. Nie mia³em zamiaru jej przekraczaæ. Znalaz³em wiêc pracê w porcie.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_03"); //Kiedy port przesta³ przyjmowaæ statki, postanowi³em zmieniæ pracê. Tak trafi³em do Akila. Prawdê powiedziawszy, ima³em siê ju¿ gorszych zajêæ.
};
/*
	Du kommst nicht aus der Gegend, richtig? 
	Ich komme von den südlichen Inseln. Irgendwann hieß es, sie bräuchten Leute in Khorinis, wegen dem magischen Erz. 
	Aber als ich ankam war da diese riesige Barriere. Und da wollte ich nicht rein. Ich hab dann angefangen im Hafen zu arbeiten. 
	Und seitdem keine Schiffe mehr kommen, bin ich halt zu Akil gegangen. Naja, ich hab schon schlechtere Jobs gemacht.  
	
	
	Hey, ich kenne da noch jemanden, der dir ein paar Sachen besorgen kann. 
	Ein Freund, der mit mir zusammen aus dem Süden gekommen ist. 
	Aber ich brauche 10 Goldmünzen, um beim Wett - Trinken in der Taverne mitzumachen.  
	Also wenn du die Info willst, dann gib mir das Gold. 
	
//Wenn du die Taverne suchst dann geh einfach über die Brücke und folge dem Weg, dann kommst direkt daran vorbei.
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
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_01"); //To prawda. Choæ ostatnio coraz rzadziej.
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_02"); //Nie staæ mnie na przesiadywanie tam.
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

	description	 = 	"Co tak dok³adnie dzieje siê w gospodzie?";
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
	AI_Output			(other, self, "DIA_Randolph_WASISTINTAVERNE_15_00"); //Co tak dok³adnie dzieje siê w gospodzie?
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_01"); //Najproœciej mówi¹c, kwitnie tam hazard.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_02"); //Dwóch goœci konkuruje w piciu piwa. Wygrywa ten, który d³u¿ej utrzyma siê na nogach.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_03"); //Przegra³em w tej konkurencji. Zanim tam wrócê, muszê trochê zarobiæ.
	Log_CreateTopic (TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry (TOPIC_Wettsaufen,"W gospodzie s¹ przyjmowane zak³ady."); 

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

	description	 = 	"Kto by³ twoim przeciwnikiem?";
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
	AI_Output			(other, self, "DIA_Randolph_GEGENWEN_15_00"); //Kto by³ twoim przeciwnikiem?
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_01"); //Ten stary hultaj - Rukhar. Jak dot¹d nie uda³o mi siê go pokonaæ.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_02"); //Coœ mi siê jednak zdaje, ¿e ten œmierdz¹cy patafian za ka¿dym razem doprawia³ moje piwo ginem.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_03"); //Wydaje mi siê, ¿e ta brudna kanalia trzyma gin w tym swoim kufrze!
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_04"); //Ktoœ powinien podmieniæ gin na wodê. Wtedy mo¿e sobie doprawiaæ moje piwo, jak d³ugo zechce.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_05"); //Gdybym tylko mia³ trochê z³ota, by raz jeszcze stan¹æ z nim do pojedynku...

	B_LogEntry (TOPIC_Wettsaufen,"Randolph opowiedzia³ mi o Rukharze i konkursie picia. Randolph nie ma ju¿ pieniêdzy, aby stan¹æ przeciwko Rukharowi."); 
	B_LogEntry (TOPIC_Wettsaufen,"Randolph podejrzewa, ¿e Rukhar oszukuje podczas zawodów w piciu. Prosi mnie, abym zamieni³ butelkê ginu, któr¹ Rukhar trzyma w swoim kufrze, na butelkê wody."); 
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

	description	 = 	"Ile pieniêdzy potrzebujesz, by wzi¹æ udzia³ w konkursie?";
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
	AI_Output			(other, self, "DIA_Randolph_WASBRAUCHSTDU_15_00"); //Ile pieniêdzy potrzebujesz, by wzi¹æ udzia³ w konkursie?
	AI_Output			(self, other, "DIA_Randolph_WASBRAUCHSTDU_06_01"); //10 sztuk z³ota.
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

	description	 = 	"Dam ci pieni¹dze, byœ móg³ stan¹æ w szranki z Rukharem.";
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
	AI_Output			(other, self, "DIA_Randolph_ICHGEBEDIRGELD_15_00"); //Dam ci pieni¹dze, byœ móg³ stan¹æ w szranki z Rukharem.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
		{
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_01"); //Naprawdê? Serdecznie dziêkujê. Wkrótce je oddam.
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_02"); //Jeœli wygram, dorzucê nawet coœ ekstra.
		
			B_LogEntry (TOPIC_Wettsaufen,"Powinienem wybraæ siê na zawody w piciu piwa."); 
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
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_03"); //Nie trzeba, sam ledwie wi¹¿esz koniec z koñcem.
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
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_01"); //Chyba nawet parê kaców na raz... Ju¿ nigdy nie dotknê alkoholu.
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_02"); //Twoje pieni¹dze przepad³y. Przykro mi.
		}
	else
		{
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_03"); //Nie. Czujê siê œwietnie.
		
			if (DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE)
			{
				AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_04"); //W koñcu siê uda³o. Wielkie dziêki za po¿yczkê. Proszê, przyjmij to w podziêce.
				CreateInvItems (self, ItMi_Gold, 20);									
				B_GiveInvItems (self, other, ItMi_Gold, 12);
				DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;					
			};
			
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_05"); //Wygl¹da na to, ¿e Rukhar d³uugo jeszcze bêdzie trzeŸwia³.
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

	description	 = 	"Oszala³eœ?";
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
			AI_Output			(other, self, "DIA_Randolph_PERM_15_00"); //Wszystko w porz¹dku?

			if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			&& (MIS_HealRandolph != LOG_SUCCESS)
				{
					if (DIA_Sagitta_HEALRANDOLPH_GotOne == FALSE)
					&& (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == TRUE)
					&& (DIA_Randolph_PERM_GotMoney == FALSE)
					{
						AI_Output			(other, self, "DIA_Randolph_PERM_15_01"); //Wysy³asz mnie bez grosza przy duszy i nawet nie raczysz uprzedziæ, ¿e to cholerstwo tyle kosztuje?
						AI_Output			(other, self, "DIA_Randolph_PERM_15_02"); //Sagitta ¿¹da ode mnie 300 sztuk z³ota.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_03"); //Nie dam ci wiêcej ni¿ 150 sztuk z³ota. Proszê, musisz mi pomóc, b³agam.
						CreateInvItems (self, ItMi_Gold, 150);									
						B_GiveInvItems (self, other, ItMi_Gold, 150);					
						DIA_Randolph_PERM_GotMoney = TRUE;
					}
					else
					{
						AI_Output			(self, other, "DIA_Randolph_PERM_06_04"); //Czujê siê potwornie. Od kiedy przesta³em piæ, wszystko mnie boli. Naprawê potrzebujê pomocy.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_05"); //Jest pewne lekarstwo, które powinno pomóc.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_06"); //Sagitta, stara zielarka, zwykle je dla mnie przygotowuje. Ale nie mogê ryzykowaæ wyprawy do niej, kiedy bandy orków grasuj¹ po okolicy.
					};
					Log_CreateTopic (TOPIC_HealRandolph, LOG_MISSION);
					Log_SetTopicStatus(TOPIC_HealRandolph, LOG_RUNNING);
					B_LogEntry (TOPIC_HealRandolph,"Randolph twierdzi, ¿e przesta³ piæ alkohol, i prosi mnie o przyniesienie od zielarki Sagitty jakichœ zió³, które pomog¹ mu przetrwaæ pierwsze ciê¿kie dni trzeŸwoœci."); 

					MIS_HealRandolph = LOG_RUNNING;
				}
			else
				{
					AI_Output			(self, other, "DIA_Randolph_PERM_06_07"); //Ci¹gle jeszcze krêci mi siê w g³owie, ale ogólnie jest o wiele lepiej.
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

	description	 = 	"Alkohol uderzy³ do g³ówki, co?";
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
	AI_Output			(other, self, "DIA_Randolph_Heilung_15_00"); //Alkohol uderzy³ do g³ówki, co?
	AI_Output			(self, other, "DIA_Randolph_Heilung_06_01"); //Ju¿ nigdy ani kropelki. Nigdy w ¿yciu. S³owo honoru.
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

	description	 = 	"Proszê, to powinno z³agodziæ objawy odstawienia trunków.";
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
	AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_00"); //Proszê, to powinno z³agodziæ objawy odstawienia trunków.
	B_GiveInvItems 		(other, self, ItPo_HealRandolph_MIS, 1);					
	
	if (Npc_IsInState (self,ZS_Pick_FP))
		{
			B_UseItem 			(self,ItPo_HealRandolph_MIS);
		};	
		
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_01"); //Och! Dziêki, stary. Nareszcie trochê odpocznê.
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_02"); //Jak ja ci siê odwdziêczê?
	
	if (DIA_Randolph_PERM_GotMoney == FALSE)
		{
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_03"); //Te kilka monet to niewiele, wiem. Ale to ostatnie pieni¹dze, jakie mi zosta³y.
		
			CreateInvItems (self, ItMi_Gold, 150);									
			B_GiveInvItems (self, other, ItMi_Gold, 150);					
		}
	else
		{
			AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_04"); //Zap³aci³em za ciebie kupê kasy, a ty dajesz mi kilka œmierdz¹cych monet? To nawet nie pokryje moich wydatków.
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_05"); //Mogê siê chyba uznaæ za szczêœliwca. Nieczêsto spotyka siê tak pomocnych paladynów. Nie s¹dzisz?
			
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






