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
	description	 = 	"Je v�echno v po��dku?";
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
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_00"); //Je v�echno v po��dku?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_01"); //Hmm... jakmile tu �ekne n�kdo n�co �patn�, za�ne tanec... Tak�e si d�vej pozor na jazyk, jinak se taky nemus� do��t z�t�ej��ho r�na.
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_02"); //Bude� taky bojovat?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_03"); //Nebudu tady jenom st�t a civ�t, a� se n�co semele. Ale nehodl�m ani nic za��nat.
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Akil�v statek ohro�uj� �old�ci."); 
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
	description	 = 	"Je v�echno v po��dku?";
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
	AI_Output (other, self, "DIA_Randolph_HALLO_15_00"); //Je v�echno v po��dku?
	
	if Npc_IsDead (Akil)
	&& Npc_IsDead (Kati)
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_01"); //Te�, kdy� Kati a Akil ode�li do Innosovy ��e, asi za�nu hospoda�it.
		
		Npc_ExchangeRoutine (self,"START");
		AI_ContinueRoutine  (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_02"); //Ano, je mi dob�e. Ten Alvares byl posledn� dobou st�le drzej�� a drzej��. Dob�e, �e u� je to za n�mi.
	};
	AI_Output (self, other, "DIA_Randolph_HALLO_06_03"); //Co bych zrovna te� pot�eboval, je po��dnej odvaz v hospod�.
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
	description	 = 	"Pos�l� m� Baltram.";
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
	AI_Output (other, self, "DIA_Randolph_Baltram_15_00"); //Poslal m� Baltram. M�m tu pro n�j vyzvednout n�jak� bal�k.
	AI_Output (self, other, "DIA_Randolph_Baltram_06_01"); //Fajn. U� jsem v�echno p�ipravil. Tady je tv�j bal�k.
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
	description	 = 	"Ty nejsi zdej��, vi�?";
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
	AI_Output (other, self, "DIA_Randolph_Geschichte_15_00"); //Ty nejsi zdej��, vi�?
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_01"); //Poch�z�m z ji�n�ch ostrov�. ��kalo se, �e tady v Korinidu budou zapot�eb� lidi kv�li magick� rud�.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_02"); //Ale kdy� jsem se sem dostal, m�li tady obrovskou bari�ru. A mn� se tam zrovna necht�lo. Tak jsem za�al pracovat v p��stavu.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_03"); //No, pak p�estaly lod� vyd�l�vat, tak jsem �el pracovat pro Akila. U� jsem d�lal hor�� v�ci, v�n�.
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

	description	 = 	"Ty jsi vysed�val v hospod�?";
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
	AI_Output			(other, self, "DIA_Randolph_TAVERNE_15_00"); //Ty jsi vysed�val v hospod�?
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_01"); //Jo, p�esn� tak. Ale to skon�ilo.
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_02"); //U� si to nem��u dovolit.
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

	description	 = 	"Co se vlastn� v t� hospod� d�je?";
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
	AI_Output			(other, self, "DIA_Randolph_WASISTINTAVERNE_15_00"); //Co se vlastn� v t� hospod� d�je?
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_01"); //Hraje se tam.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_02"); //Ti chl�pkov� tam sout�ej ka�dej s ka�d�m. Kdo vydr�� nejv�c piv, vyhr�l.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_03"); //Nakonec jsem ned�lal nic jin�ho ne� prohr�val, a te� pot�ebuju vyd�lat n�co pen�z.
	Log_CreateTopic (TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry (TOPIC_Wettsaufen,"V hospod� se uzav�raj� s�zky."); 

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

	description	 = 	"Proti komu jsi hr�l?";
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
	AI_Output			(other, self, "DIA_Randolph_GEGENWEN_15_00"); //Proti komu jsi hr�l?
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_01"); //Proti Rukharovi, tomu star�mu budi�kni�emovi. Co v�m, poka�d� m� porazil.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_02"); //Ale m�m takov� nejasn� tu�en�, �e mi ten mizernej hajzl v�dycky ��znul pivo ginem.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_03"); //Nejsp� ho m� schovanej ve sv� truhle. Ten v�iv�ckej zkurvysyn!
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_04"); //N�kdo by mu do t� jeho truhly m�l nastr�it �istou vodu. Pak by toho mohl do piva p�id�vat, kolik by cht�l.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_05"); //Kdybych tak m�l dost pen�z, abych si to s n�m mohl rozdat je�t� jednou.

	B_LogEntry (TOPIC_Wettsaufen,"Randolph mi vypr�v�l o Rukharovi a o sout�i v pit� a tak� o tom, �e u� nem�l dost pen�z, aby s Rukharem zm��il s�ly je�t� jednou."); 
	B_LogEntry (TOPIC_Wettsaufen,"Randolph se domn�v�, �e Rukhar p�i souboji v pit� podv�d�l. R�d by mu v truhlici vym�nil jednu l�hev ginu za l�hev vody."); 
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

	description	 = 	"Kolik na tu sout� pot�ebuje�?";
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
	AI_Output			(other, self, "DIA_Randolph_WASBRAUCHSTDU_15_00"); //Kolik na tu sout� pot�ebuje�?
	AI_Output			(self, other, "DIA_Randolph_WASBRAUCHSTDU_06_01"); //10 zlat�ch.
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

	description	 = 	"D�m ti ty pen�ze, aby sis to mohl rozdat s Rukharem.";
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
	AI_Output			(other, self, "DIA_Randolph_ICHGEBEDIRGELD_15_00"); //D�m ti ty pen�ze, aby sis to mohl rozdat s Rukharem.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
		{
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_01"); //(nad�en�) Fakt? D�ky moc. Brzo ti to vr�t�m.
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_02"); //Kdy� vyhraju, vyklop�m je�t� o trochu v�c, ne� jsi mi dal. Je�t� se uvid�me.
		
			B_LogEntry (TOPIC_Wettsaufen,"U� jsem si vsadil a te� se na to pod�v�m."); 
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
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_03"); //To je v po��dku. Nem� dost ani pro sebe.
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
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_01"); //P��mo matka v�ech kocovin. A j� se j� nem��u zbavit. U� nebudu chlastat, p��sah�m.
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_02"); //Tvoje pen�ze jsou fu�. Je mi l�to.
		}
	else
		{
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_03"); //Ani n�pad. Je mi fajn, v�n�.
		
			if (DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE)
			{
				AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_04"); //Tak to tentokr�t kone�n� vy�lo. Je�t� jednou d�k za pen�ze. Tady, vezmi si je zp�tky.
				CreateInvItems (self, ItMi_Gold, 20);									
				B_GiveInvItems (self, other, ItMi_Gold, 12);
				DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;					
			};
			
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_05"); //Vypad� to, �e se z toho Rukhar jen tak nedostane.
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

	description	 = 	"Jsi v pohod�?";
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
			AI_Output			(other, self, "DIA_Randolph_PERM_15_00"); //Jsi v po��dku?

			if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			&& (MIS_HealRandolph != LOG_SUCCESS)
				{
					if (DIA_Sagitta_HEALRANDOLPH_GotOne == FALSE)
					&& (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == TRUE)
					&& (DIA_Randolph_PERM_GotMoney == FALSE)
					{
						AI_Output			(other, self, "DIA_Randolph_PERM_15_01"); //Pos�l� m� tam bez jedin� zlatky a v�bec se neobt�uje� mi ��ct, �e to je tak drah�?
						AI_Output			(other, self, "DIA_Randolph_PERM_15_02"); //Sagitta po mn� chce 300 zlat�ch.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_03"); //Nem��u ti d�t v�c ne� 150 zlat�ch. Pros�m, mus� mi pomoct. Pros�m.
						CreateInvItems (self, ItMi_Gold, 150);									
						B_GiveInvItems (self, other, ItMi_Gold, 150);					
						DIA_Randolph_PERM_GotMoney = TRUE;
					}
					else
					{
						AI_Output			(self, other, "DIA_Randolph_PERM_06_04"); //Jsem v�n� na dn�. I kdybych p�estal p�t, zabije m� abs��k. V�n� pot�ebuju pomoct.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_05"); //Je tu jeden zp�sob, jak bys mi mohl pomoct.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_06"); //Sagitta, ta star� bylink��ka, to pro m� p�ipravuje. Ale nemysl�m si, �e bych to mohl dok�zat, kdy� je te� v okol� tolik sk�et�.
					};
					Log_CreateTopic (TOPIC_HealRandolph, LOG_MISSION);
					Log_SetTopicStatus(TOPIC_HealRandolph, LOG_RUNNING);
					B_LogEntry (TOPIC_HealRandolph,"Randolph pr� nechal pit� a poslal m� za bylink��kou Sagittou, aby mu dala n�co na jeho abstinen�n� p��znaky."); 

					MIS_HealRandolph = LOG_RUNNING;
				}
			else
				{
					AI_Output			(self, other, "DIA_Randolph_PERM_06_07"); //Je�t� po��d se mi trochu pletou nohy, ale jinak jsem v pohod�.
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
	AI_Output			(self, other, "DIA_Randolph_Heilung_06_01"); //U� si ned�m ani pan�ka. Ne v tomhle �ivot�. To se m��e� vsadit, chlape.
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

	description	 = 	"Tady, tohle ti od toho abs��ku trochu pom��e.";
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
	AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_00"); //Tady. To by m�lo zm�rnit abstinen�n� p��znaky.
	B_GiveInvItems 		(other, self, ItPo_HealRandolph_MIS, 1);					
	
	if (Npc_IsInState (self,ZS_Pick_FP))
		{
			B_UseItem 			(self,ItPo_HealRandolph_MIS);
		};	
		
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_01"); //Ach! D�ky, chlape. Te� si zase budu moct odpo�inout.
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_02"); //Jak se ti za to budu moct kdy odvd��it?
	
	if (DIA_Randolph_PERM_GotMoney == FALSE)
		{
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_03"); //H�d�m, �e t�chhle p�r minc� je dobrejch akor�t k tomu, abych si zachoval tv��. Ale to je v�echno, je mi l�to.
		
			CreateInvItems (self, ItMi_Gold, 150);									
			B_GiveInvItems (self, other, ItMi_Gold, 150);					
		}
	else
		{
			AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_04"); //Zaplatil jsem za tebe spoustu pen�z a t�ch tvejch p�r u�mudlanejch minc� nesta�� ani na pokryt� mejch n�klad�.
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_05"); //Fajn - v tom p��pad� m��u mluvit o �t�st�, �e jsem potkal tak vst��cn�ho paladina, nemysl�?
			
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






