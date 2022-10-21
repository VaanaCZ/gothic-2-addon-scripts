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
	description	 = 	"Je vöechno v po¯·dku?";
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
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_00"); //Je vöechno v po¯·dku?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_01"); //Hmm... jakmile tu ¯ekne nÏkdo nÏco öpatnÏ, zaËne tanec... Takûe si d·vej pozor na jazyk, jinak se taky nemusÌö doûÌt zÌt¯ejöÌho r·na.
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_02"); //Budeö taky bojovat?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_03"); //Nebudu tady jenom st·t a civÏt, aû se nÏco semele. Ale nehodl·m ani nic zaËÌnat.
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Akil˘v statek ohroûujÌ ûold·ci."); 
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
	description	 = 	"Je vöechno v po¯·dku?";
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
	AI_Output (other, self, "DIA_Randolph_HALLO_15_00"); //Je vöechno v po¯·dku?
	
	if Npc_IsDead (Akil)
	&& Npc_IsDead (Kati)
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_01"); //TeÔ, kdyû Kati a Akil odeöli do Innosovy ¯Ìöe, asi zaËnu hospoda¯it.
		
		Npc_ExchangeRoutine (self,"START");
		AI_ContinueRoutine  (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_02"); //Ano, je mi dob¯e. Ten Alvares byl poslednÌ dobou st·le drzejöÌ a drzejöÌ. Dob¯e, ûe uû je to za n·mi.
	};
	AI_Output (self, other, "DIA_Randolph_HALLO_06_03"); //Co bych zrovna teÔ pot¯eboval, je po¯·dnej odvaz v hospodÏ.
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
	description	 = 	"PosÌl· mÏ Baltram.";
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
	AI_Output (other, self, "DIA_Randolph_Baltram_15_00"); //Poslal mÏ Baltram. M·m tu pro nÏj vyzvednout nÏjak˝ balÌk.
	AI_Output (self, other, "DIA_Randolph_Baltram_06_01"); //Fajn. Uû jsem vöechno p¯ipravil. Tady je tv˘j balÌk.
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
	description	 = 	"Ty nejsi zdejöÌ, viÔ?";
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
	AI_Output (other, self, "DIA_Randolph_Geschichte_15_00"); //Ty nejsi zdejöÌ, viÔ?
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_01"); //Poch·zÌm z jiûnÌch ostrov˘. ÿÌkalo se, ûe tady v Korinidu budou zapot¯ebÌ lidi kv˘li magickÈ rudÏ.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_02"); //Ale kdyû jsem se sem dostal, mÏli tady obrovskou bariÈru. A mnÏ se tam zrovna nechtÏlo. Tak jsem zaËal pracovat v p¯Ìstavu.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_03"); //No, pak p¯estaly lodÏ vydÏl·vat, tak jsem öel pracovat pro Akila. Uû jsem dÏlal horöÌ vÏci, v·ûnÏ.
};
/*
	Du kommst nicht aus der Gegend, richtig? 
	Ich komme von den s¸dlichen Inseln. Irgendwann hieﬂ es, sie br‰uchten Leute in Khorinis, wegen dem magischen Erz. 
	Aber als ich ankam war da diese riesige Barriere. Und da wollte ich nicht rein. Ich hab dann angefangen im Hafen zu arbeiten. 
	Und seitdem keine Schiffe mehr kommen, bin ich halt zu Akil gegangen. Naja, ich hab schon schlechtere Jobs gemacht.  
	
	
	Hey, ich kenne da noch jemanden, der dir ein paar Sachen besorgen kann. 
	Ein Freund, der mit mir zusammen aus dem S¸den gekommen ist. 
	Aber ich brauche 10 Goldm¸nzen, um beim Wett - Trinken in der Taverne mitzumachen.  
	Also wenn du die Info willst, dann gib mir das Gold. 
	
//Wenn du die Taverne suchst dann geh einfach ¸ber die Br¸cke und folge dem Weg, dann kommst direkt daran vorbei.
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

	description	 = 	"Ty jsi vysed·val v hospodÏ?";
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
	AI_Output			(other, self, "DIA_Randolph_TAVERNE_15_00"); //Ty jsi vysed·val v hospodÏ?
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_01"); //Jo, p¯esnÏ tak. Ale to skonËilo.
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_02"); //Uû si to nem˘ûu dovolit.
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

	description	 = 	"Co se vlastnÏ v tÈ hospodÏ dÏje?";
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
	AI_Output			(other, self, "DIA_Randolph_WASISTINTAVERNE_15_00"); //Co se vlastnÏ v tÈ hospodÏ dÏje?
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_01"); //Hraje se tam.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_02"); //Ti chl·pkovÈ tam soutÏûej kaûdej s kaûd˝m. Kdo vydrûÌ nejvÌc piv, vyhr·l.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_03"); //Nakonec jsem nedÏlal nic jinÈho neû prohr·val, a teÔ pot¯ebuju vydÏlat nÏco penÏz.
	Log_CreateTopic (TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry (TOPIC_Wettsaufen,"V hospodÏ se uzavÌrajÌ s·zky."); 

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

	description	 = 	"Proti komu jsi hr·l?";
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
	AI_Output			(other, self, "DIA_Randolph_GEGENWEN_15_00"); //Proti komu jsi hr·l?
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_01"); //Proti Rukharovi, tomu star˝mu budiûkniËemovi. Co vÌm, pokaûd˝ mÏ porazil.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_02"); //Ale m·m takov˝ nejasn˝ tuöenÌ, ûe mi ten mizernej hajzl vûdycky ¯Ìznul pivo ginem.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_03"); //NejspÌö ho m· schovanej ve sv˝ truhle. Ten vöiv·ckej zkurvysyn!
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_04"); //NÏkdo by mu do t˝ jeho truhly mÏl nastrËit Ëistou vodu. Pak by toho mohl do piva p¯id·vat, kolik by chtÏl.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_05"); //Kdybych tak mÏl dost penÏz, abych si to s nÌm mohl rozdat jeötÏ jednou.

	B_LogEntry (TOPIC_Wettsaufen,"Randolph mi vypr·vÏl o Rukharovi a o soutÏûi v pitÌ a takÈ o tom, ûe uû nemÏl dost penÏz, aby s Rukharem zmÏ¯il sÌly jeötÏ jednou."); 
	B_LogEntry (TOPIC_Wettsaufen,"Randolph se domnÌv·, ûe Rukhar p¯i souboji v pitÌ podv·dÏl. R·d by mu v truhlici vymÏnil jednu l·hev ginu za l·hev vody."); 
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

	description	 = 	"Kolik na tu soutÏû pot¯ebujeö?";
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
	AI_Output			(other, self, "DIA_Randolph_WASBRAUCHSTDU_15_00"); //Kolik na tu soutÏû pot¯ebujeö?
	AI_Output			(self, other, "DIA_Randolph_WASBRAUCHSTDU_06_01"); //10 zlat˝ch.
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

	description	 = 	"D·m ti ty penÌze, aby sis to mohl rozdat s Rukharem.";
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
	AI_Output			(other, self, "DIA_Randolph_ICHGEBEDIRGELD_15_00"); //D·m ti ty penÌze, aby sis to mohl rozdat s Rukharem.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
		{
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_01"); //(nadöenÏ) Fakt? DÌky moc. Brzo ti to vr·tÌm.
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_02"); //Kdyû vyhraju, vyklopÌm jeötÏ o trochu vÌc, neû jsi mi dal. JeötÏ se uvidÌme.
		
			B_LogEntry (TOPIC_Wettsaufen,"Uû jsem si vsadil a teÔ se na to podÌv·m."); 
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
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_03"); //To je v po¯·dku. Nem·ö dost ani pro sebe.
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

	description	 = 	"Kocovina?";
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
	AI_Output			(other, self, "DIA_Randolph_WETTKAMPFZUENDE_15_00"); //Kocovina?
	
	
	if (Rukhar_Won_Wettkampf == TRUE)
		{
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_01"); //P¯Ìmo matka vöech kocovin. A j· se jÌ nem˘ûu zbavit. Uû nebudu chlastat, p¯Ìsah·m.
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_02"); //Tvoje penÌze jsou fuË. Je mi lÌto.
		}
	else
		{
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_03"); //Ani n·pad. Je mi fajn, v·ûnÏ.
		
			if (DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE)
			{
				AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_04"); //Tak to tentokr·t koneËnÏ vyölo. JeötÏ jednou dÌk za penÌze. Tady, vezmi si je zp·tky.
				CreateInvItems (self, ItMi_Gold, 20);									
				B_GiveInvItems (self, other, ItMi_Gold, 12);
				DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;					
			};
			
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_05"); //Vypad· to, ûe se z toho Rukhar jen tak nedostane.
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

	description	 = 	"Jsi v pohodÏ?";
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
			AI_Output			(other, self, "DIA_Randolph_PERM_15_00"); //Jsi v po¯·dku?

			if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			&& (MIS_HealRandolph != LOG_SUCCESS)
				{
					if (DIA_Sagitta_HEALRANDOLPH_GotOne == FALSE)
					&& (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == TRUE)
					&& (DIA_Randolph_PERM_GotMoney == FALSE)
					{
						AI_Output			(other, self, "DIA_Randolph_PERM_15_01"); //PosÌl·ö mÏ tam bez jedin˝ zlatky a v˘bec se neobtÏûujeö mi ¯Ìct, ûe to je tak drah˝?
						AI_Output			(other, self, "DIA_Randolph_PERM_15_02"); //Sagitta po mnÏ chce 300 zlat˝ch.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_03"); //Nem˘ûu ti d·t vÌc neû 150 zlat˝ch. ProsÌm, musÌö mi pomoct. ProsÌm.
						CreateInvItems (self, ItMi_Gold, 150);									
						B_GiveInvItems (self, other, ItMi_Gold, 150);					
						DIA_Randolph_PERM_GotMoney = TRUE;
					}
					else
					{
						AI_Output			(self, other, "DIA_Randolph_PERM_06_04"); //Jsem v·ûnÏ na dnÏ. I kdybych p¯estal pÌt, zabije mÏ absù·k. V·ûnÏ pot¯ebuju pomoct.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_05"); //Je tu jeden zp˘sob, jak bys mi mohl pomoct.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_06"); //Sagitta, ta star· bylink·¯ka, to pro mÏ p¯ipravuje. Ale nemyslÌm si, ûe bych to mohl dok·zat, kdyû je teÔ v okolÌ tolik sk¯et˘.
					};
					Log_CreateTopic (TOPIC_HealRandolph, LOG_MISSION);
					Log_SetTopicStatus(TOPIC_HealRandolph, LOG_RUNNING);
					B_LogEntry (TOPIC_HealRandolph,"Randolph pr˝ nechal pitÌ a poslal mÏ za bylink·¯kou Sagittou, aby mu dala nÏco na jeho abstinenËnÌ p¯Ìznaky."); 

					MIS_HealRandolph = LOG_RUNNING;
				}
			else
				{
					AI_Output			(self, other, "DIA_Randolph_PERM_06_07"); //JeötÏ po¯·d se mi trochu pletou nohy, ale jinak jsem v pohodÏ.
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

	description	 = 	"Chlast ti nalezl do hlavy, co?";
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
	AI_Output			(other, self, "DIA_Randolph_Heilung_15_00"); //Chlast ti stoupnul do hlavy, co?
	AI_Output			(self, other, "DIA_Randolph_Heilung_06_01"); //Uû si ned·m ani pan·ka. Ne v tomhle ûivotÏ. To se m˘ûeö vsadit, chlape.
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

	description	 = 	"Tady, tohle ti od toho absù·ku trochu pom˘ûe.";
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
	AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_00"); //Tady. To by mÏlo zmÌrnit abstinenËnÌ p¯Ìznaky.
	B_GiveInvItems 		(other, self, ItPo_HealRandolph_MIS, 1);					
	
	if (Npc_IsInState (self,ZS_Pick_FP))
		{
			B_UseItem 			(self,ItPo_HealRandolph_MIS);
		};	
		
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_01"); //Ach! DÌky, chlape. TeÔ si zase budu moct odpoËinout.
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_02"); //Jak se ti za to budu moct kdy odvdÏËit?
	
	if (DIA_Randolph_PERM_GotMoney == FALSE)
		{
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_03"); //H·d·m, ûe tÏchhle p·r mincÌ je dobrejch akor·t k tomu, abych si zachoval tv·¯. Ale to je vöechno, je mi lÌto.
		
			CreateInvItems (self, ItMi_Gold, 150);									
			B_GiveInvItems (self, other, ItMi_Gold, 150);					
		}
	else
		{
			AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_04"); //Zaplatil jsem za tebe spoustu penÏz a tÏch tvejch p·r uömudlanejch mincÌ nestaËÌ ani na pokrytÌ mejch n·klad˘.
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_05"); //Fajn - v tom p¯ÌpadÏ m˘ûu mluvit o ötÏstÌ, ûe jsem potkal tak vst¯ÌcnÈho paladina, nemyslÌö?
			
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






