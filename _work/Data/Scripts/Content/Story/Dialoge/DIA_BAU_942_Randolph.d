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
	description	 = 	"Tout va bien ?";
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
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_00"); //Tout va bien ?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_01"); //Hum... D�s que quelqu'un dit quelque chose de mal dans le coin, les probl�mes commencent... alors m�fiez-vous ou il y aura un carnage.
	AI_Output (other, self, "DIA_Randolph_SchwereLuft_15_02"); //Participerez-vous aux combats ?
	AI_Output (self, other, "DIA_Randolph_SchwereLuft_06_03"); //Je ne vais pas rester ici � ne rien faire quand il y aura du grabuge mais je ne vais certainement pas le provoquer.
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"La ferme d'Akil est menac�e par des mercenaires."); 
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
	description	 = 	"Tout va bien ?";
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
	AI_Output (other, self, "DIA_Randolph_HALLO_15_00"); //Tout va bien ?
	
	if Npc_IsDead (Akil)
	&& Npc_IsDead (Kati)
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_01"); //Maintenant que Kati et Akil sont au royaume d'Innos, je vais devoir m'occuper de la ferme.
		
		Npc_ExchangeRoutine (self,"START");
		AI_ContinueRoutine  (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Randolph_HALLO_06_02"); //Oui, je vais bien. Cet Alvares prend de l'assurance ces derniers temps. C'est une bonne chose que tout soit fini.
	};
	AI_Output (self, other, "DIA_Randolph_HALLO_06_03"); //J'aurais bien besoin d'un bon coup � boire � la taverne.
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
	description	 = 	"Je suis envoy� par Baltram...";
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
	AI_Output (other, self, "DIA_Randolph_Baltram_15_00"); //Baltram m'envoie. Je dois r�cup�rer une livraison pour lui.
	AI_Output (self, other, "DIA_Randolph_Baltram_06_01"); //Parfait. J'ai d�j� tout pr�par�. Voici votre paquet.
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
	description	 = 	"Vous n'�tes pas du coin, n'est-ce pas ?";
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
	AI_Output (other, self, "DIA_Randolph_Geschichte_15_00"); //Vous n'�tes pas d'ici, n'est-ce pas ?
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_01"); //Je viens des �les du sud. On a dit qu'ils avaient besoin de monde � Khorinis � cause du minerai magique.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_02"); //Mais, quand je suis arriv� ici, il y avait cette �norme Barri�re et je ne voulais pas aller l�-dedans. Alors j'ai commenc� � travailler au port.
	AI_Output (self, other, "DIA_Randolph_Geschichte_06_03"); //Puis les navires ont cess� d'arriver et j'ai donc �t� travailler pour Akil. J'ai eu des emplois plus p�nibles.
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

	description	 = 	"Vous tra�nez � la taverne ?";
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
	AI_Output			(other, self, "DIA_Randolph_TAVERNE_15_00"); //Vous passez beaucoup de temps � la taverne ?
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_01"); //Oui, mais pas r�cemment.
	AI_Output			(self, other, "DIA_Randolph_TAVERNE_06_02"); //Je ne peux plus me permettre d'y aller.
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

	description	 = 	"Qu'est-ce qui se passe dans la taverne ?";
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
	AI_Output			(other, self, "DIA_Randolph_WASISTINTAVERNE_15_00"); //Que se passe-t-il exactement � la taverne ?
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_01"); //On y prend des paris.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_02"); //Deux gars s'affrontent pour savoir celui qui pourra boire le plus de bi�re.
	AI_Output			(self, other, "DIA_Randolph_WASISTINTAVERNE_06_03"); //Sur la fin, je ne faisais que perdre et maintenant je dois r�unir un peu d'argent.
	Log_CreateTopic (TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry (TOPIC_Wettsaufen,"Il y a un concours � la taverne."); 

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

	description	 = 	"A qui vous �tes-vous mesur� ?";
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
	AI_Output			(other, self, "DIA_Randolph_GEGENWEN_15_00"); //A qui vous �tes-vous mesur� ?
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_01"); //A Rukhar, ce vieux bon � rien. Pour l'instant, il m'a toujours battu.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_02"); //Mais j'ai l'impression qu'� chaque fois ce sale porc a coup� ma bi�re avec du gin.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_03"); //Je crois qu'il planque son gin dans son foutu coffre. Quelle ordure !
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_04"); //Quelqu'un devrait mettre de l'eau � la place du gin dans son coffre. Comme �a, il pourra couper ma bi�re autant qu'il voudra.
	AI_Output			(self, other, "DIA_Randolph_GEGENWEN_06_05"); //Si seulement j'avais assez d'argent pour l'affronter encore une fois.

	B_LogEntry (TOPIC_Wettsaufen,"Randolph m'a parl� de Rukhar et du concours de boisson. Randolph n'a pas assez d'argent pour affronter de nouveau Rukhar."); 
	B_LogEntry (TOPIC_Wettsaufen,"Randolph soup�onne Rukhar de tricher au concours de boisson. Randolph voudrait �changer la bouteille de gin du coffre de Rukhar contre une bouteille d'eau."); 
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

	description	 = 	"De combien avez-vous besoin pour le concours ?";
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
	AI_Output			(other, self, "DIA_Randolph_WASBRAUCHSTDU_15_00"); //De combien d'argent avez-vous besoin pour le concours ?
	AI_Output			(self, other, "DIA_Randolph_WASBRAUCHSTDU_06_01"); //10 pi�ces d'or.
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

	description	 = 	"Je vais vous donner l'argent pour concourir contre Rukhar.";
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
	AI_Output			(other, self, "DIA_Randolph_ICHGEBEDIRGELD_15_00"); //Je vais vous donner l'argent pour concourir contre Rukhar.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
		{
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_01"); //(enthousiaste) Vraiment ? Merci beaucoup. Je vous rembourserai bient�t.
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_02"); //Si je gagne, je vous en donnerai m�me un peu plus. On se revoit plus tard.
		
			B_LogEntry (TOPIC_Wettsaufen,"Le concours est lanc�. Il faut que je voie �a."); 
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
			AI_Output			(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_03"); //Ce n'est pas grave. Vous n'en avez m�me pas assez pour vous.
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

	description	 = 	"La gueule de bois ?";
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
	AI_Output			(other, self, "DIA_Randolph_WETTKAMPFZUENDE_15_00"); //La gueule de bois ?
	
	
	if (Rukhar_Won_Wettkampf == TRUE)
		{
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_01"); //La plus �norme des gueules de bois et �a ne veut pas passer. Je jure de ne plus jamais boire une goutte.
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_02"); //J'ai perdu votre argent. Navr�.
		}
	else
		{
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_03"); //Nan. Je me sens vraiment bien.
		
			if (DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE)
			{
				AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_04"); //J'ai enfin r�ussi. Merci pour l'argent. Tenez, je vous le rends.
				CreateInvItems (self, ItMi_Gold, 20);									
				B_GiveInvItems (self, other, ItMi_Gold, 12);
				DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;					
			};
			
			AI_Output			(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_05"); //On dirait que Rukhar ne va pas s'en remettre avant longtemps.
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

	description	 = 	"Etes-vous fou ?";
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
			AI_Output			(other, self, "DIA_Randolph_PERM_15_00"); //Vous allez bien ?

			if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			&& (MIS_HealRandolph != LOG_SUCCESS)
				{
					if (DIA_Sagitta_HEALRANDOLPH_GotOne == FALSE)
					&& (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == TRUE)
					&& (DIA_Randolph_PERM_GotMoney == FALSE)
					{
						AI_Output			(other, self, "DIA_Randolph_PERM_15_01"); //Vous m'avez envoy� l�-bas sans un sou et vous avez omis de me dire que ce truc �tait aussi cher ?
						AI_Output			(other, self, "DIA_Randolph_PERM_15_02"); //Sagitta veut 300 pi�ces d'or.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_03"); //Je ne peux pas vous donner plus de 150 pi�ces d'or. S'il vous pla�t, aidez-moi. Par piti�.
						CreateInvItems (self, ItMi_Gold, 150);									
						B_GiveInvItems (self, other, ItMi_Gold, 150);					
						DIA_Randolph_PERM_GotMoney = TRUE;
					}
					else
					{
						AI_Output			(self, other, "DIA_Randolph_PERM_06_04"); //J'ai vraiment mon compte. Depuis que j'ai arr�t� de boire, le manque d'alcool me tue. J'ai besoin d'aide.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_05"); //Il y a un rem�de qui pourrait m'aider.
						AI_Output			(self, other, "DIA_Randolph_PERM_06_06"); //Sagitta, la vieille sorci�re herboriste, m'en a d�j� pr�par�. Mais je doute de pouvoir aller l�-bas avec tous ces orques dans le coin.
					};
					Log_CreateTopic (TOPIC_HealRandolph, LOG_MISSION);
					Log_SetTopicStatus(TOPIC_HealRandolph, LOG_RUNNING);
					B_LogEntry (TOPIC_HealRandolph,"Randolph semble avoir renonc� � boire et il m'a envoy� voir l'herboriste Sagitta pour qu'elle lui donne quelque chose pour son �tat de manque."); 

					MIS_HealRandolph = LOG_RUNNING;
				}
			else
				{
					AI_Output			(self, other, "DIA_Randolph_PERM_06_07"); //Je suis encore un peu flageolant mais je vais beaucoup mieux.
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

	description	 = 	"La boisson vous est mont�e � la t�te, hein ?";
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
	AI_Output			(other, self, "DIA_Randolph_Heilung_15_00"); //La boisson vous est mont�e � la t�te, hein ?
	AI_Output			(self, other, "DIA_Randolph_Heilung_06_01"); //Je ne boirai plus jamais une goutte. Jamais de la vie. Vous pouvez en �tre s�r.
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

	description	 = 	"Tenez, cela va calmer votre �tat de manque.";
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
	AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_00"); //Tenez. Cela va calmer votre �tat de manque.
	B_GiveInvItems 		(other, self, ItPo_HealRandolph_MIS, 1);					
	
	if (Npc_IsInState (self,ZS_Pick_FP))
		{
			B_UseItem 			(self,ItPo_HealRandolph_MIS);
		};	
		
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_01"); //Oh ! Merci, mon gars. Maintenant je vais me tenir tranquille.
	AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_02"); //Comment pourrai-je vous remercier ?
	
	if (DIA_Randolph_PERM_GotMoney == FALSE)
		{
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_03"); //Ces quelques pi�ces ne sont qu'un pi�tre d�dommagement mais c'est tout ce que j'ai.
		
			CreateInvItems (self, ItMi_Gold, 150);									
			B_GiveInvItems (self, other, ItMi_Gold, 150);					
		}
	else
		{
			AI_Output			(other, self, "DIA_Randolph_SAGITTAHEAL_15_04"); //Vous m'avez co�t� cher et ces quelques pi�ces sont loin de couvrir mes d�penses.
			AI_Output			(self, other, "DIA_Randolph_SAGITTAHEAL_06_05"); //Eh bien, dans ce cas, je peux m'estimer heureux d'avoir rencontr� un paladin aussi compr�hensif, hein ?
			
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






