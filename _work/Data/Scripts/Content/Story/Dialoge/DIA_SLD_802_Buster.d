// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Buster_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_EXIT_Condition;
	information	= DIA_Buster_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Buster_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				   Hallo 
// ************************************************************

INSTANCE DIA_Buster_Hello (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_Hello_Condition;
	information	= DIA_Buster_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Buster_Hello_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) //Wegen News - Info kommt nicht mehr gut, wenn schonmal gepr�gelt
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Buster_Hello_13_00");	//Wen haben wir denn da? Kenn ich dich nicht irgendwo her?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Schon m�glich. Ich bin auf dem Weg zum Gro�bauern." 	,DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice		(DIA_Buster_Hello, "Wer will das wissen?"									,DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WhoAreYou_15_00"); //Wer will das wissen?
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_01"); //Ich bin Buster, einer von Lees S�ldnern!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_02"); //Und DU solltest lieber ein bisschen netter zu mir sein, oder ich zieh dir das Fell �ber die Ohren!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_03"); //Also, was willst du hier?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Das geht dich nichts an."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Ich kenne Lee!"											,DIA_Buster_Hello_IKnowLee);
	Info_AddChoice		(DIA_Buster_Hello, "Ich bin nur ein Reisender auf dem Weg zum Gro�bauern." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IKnowLee_15_00"); //Ich kenne Lee!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_01"); //Jeder kennt Lee! Das hei�t gar nichts, klar! Im Moment redest du mit MIR!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_02"); //Also, wohin willst du?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Das geht dich nichts an."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Ich bin nur ein Reisender auf dem Weg zum Gro�bauern." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output (other,self ,"DIA_Buster_Hello_NotYourBusiness_15_00"); //Das geht dich nichts an.
	AI_Output (self ,other,"DIA_Buster_Hello_NotYourBusiness_13_01"); //So redet niemand mit mir, du Wurm! Ich glaube, es wird mal Zeit f�r'n bisschen Pr�gel!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output (other,self ,"DIA_Buster_Hello_GoingToFarm_15_00"); //Schon m�glich. Ich bin auf dem Weg zum Gro�bauern.
	AI_Output (self ,other,"DIA_Buster_Hello_GoingToFarm_13_01"); //So, so ... Hm - gef�hrlich siehst du mir ja nicht gerade aus.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Willst du's mal testen?"								,DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice		(DIA_Buster_Hello, "Das eine oder andere Biest habe ich schon erledigt."	,DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice		(DIA_Buster_Hello, "Bin ich auch nicht." 									,DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output (other,self ,"DIA_Buster_Hello_ImNoDanger_15_00"); //Bin ich auch nicht.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_01"); //(selbstgef�llig) Tja, mit den Jahren bekommt man einen Blick f�r so was, Kleiner.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_02"); //Wir legen uns hier regelm��ig mit Orks an. Oder mit den Wachen aus der Stadt. Die k�nnen ziemlich hartn�ckig sein (lacht).
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Du meinst ECHTE Orks? Die gro�en?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "Na und?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Beeindruckend." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SlewBeasts_15_00"); //Das eine oder andere Biest habe ich schon erledigt.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_01"); //Ha! (lacht) Du hast wahrscheinlich die K�fer auf den Feldern gepl�ttet und ein paar Ratten aus ihren L�chern gejagt.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_02"); //Wir haben es hier mit Orks zu tun! Na ja, und mit den dreckigen Stadtwachen. (lacht abf�llig)
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Du meinst ECHTE Orks? Die gro�en?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "Na und?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Beeindruckend." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_00"); //Willst du's mal testen?
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_01"); //Oha! Da bin ich wohl an den Falschen geraten, was?
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_02"); //Stimmt genau.
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_03"); //Dann zeig mal, was du drauf hast!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Impressive_15_00"); //Beeindruckend.
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_01"); //(lacht) Das ist unser Gesch�ft, Junge! Wir stellen sogar selber unsere Waffen und R�stungen her!
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_02"); //Jeden Tag lachen wir dem Tod ins Gesicht! Aber davon versteht ein Landei wie du ja nichts!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Ich muss dir wohl mal zeigen, wieviel ich davon verstehe!"	,DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice		(DIA_Buster_Hello, "Wird schon so sein."									,DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IfYouSaySo_15_00"); //Wird schon so sein.
	AI_Output (self ,other,"DIA_Buster_Hello_IfYouSaySo_13_01"); //(schnaubt gelangweilt) Mach, dass du weiterkommst, du Waschlappen!

	AI_StopProcessInfos	(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_LetMeShowYou_15_00"); //Ich muss dir wohl mal zeigen, wie viel ich davon verstehe!
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_01"); //Du willst wohl den Bauernaufstand ganz alleine antreten, was?
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_02"); //Na, dann zeig mal, was du drauf hast!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SoWhat_15_00"); //Na und?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_01"); //(schnaubt) Als ob du w�sstest, wovon ich rede. H�ltst dich wohl f�r verdammt stark, was?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_02"); //(b�se) Vielleicht ist es an der Zeit, dass dir mal jemand 'ne Lektion erteilt!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Jederzeit!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "War nur'n Scherz..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_00"); //Meinst du ECHTE Orks? Die gro�en?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_01"); //(seufzt) Ich meine ... Moment mal! Willst du mich verarschen?!
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_02"); //(schmunzelt) Nichts liegt mir ferner.
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_03"); //Du Wurm! (dumm-agressiv) Du willst es wohl wissen, he?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_04"); //Dann zeig mir doch mal, was du drauf hast, du Held!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Jederzeit!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "War nur'n Scherz..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Whenever_15_00"); //Jederzeit!
	AI_Output (self ,other,"DIA_Buster_Hello_Whenever_13_01"); //Na, dann komm mal her, B�rschchen!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output (other,self ,"DIA_Buster_Hello_JustJoking_15_00"); //War nur'n Scherz ...
	AI_Output (self ,other,"DIA_Buster_Hello_JustJoking_13_01"); //Jaja, kneif ruhig den Schwanz ein! Mach, dass du wegkommst!
	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				 FightNone
// ************************************************************

INSTANCE DIA_Buster_FightNone (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_FightNone_Condition;
	information	= DIA_Buster_FightNone_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Buster_FightNone_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Buster_Hello))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output (self, other,"DIA_Buster_FightNone_13_00"); //Was willst du, du Weichei?
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************

INSTANCE DIA_Buster_Duell (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 3;
	condition	= DIA_Buster_Duell_Condition;
	information	= DIA_Buster_Duell_Info;
	permanent	= TRUE;
	description = "Ich fordere dich zum Duell!";
};                       

FUNC INT DIA_Buster_Duell_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Duell_Info()
{	
	AI_Output (other, self,"DIA_Buster_Duell_15_00"); //Ich fordere dich zum Duell!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_01"); //Aha! Du willst es nicht auf dir sitzen lassen, was? Na gut - komm her!
	}
	else //WON oder CANCEL
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_02"); //Du willst es noch mal versuchen? Du bist ganz sch�n hartn�ckig - na gut, komm her!
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_Duell_13_03"); //Aber nicht wieder wegrennen!
		};
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************
INSTANCE DIA_Buster_WannaJoin (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WannaJoin_Condition;
	information	= DIA_Buster_WannaJoin_Info;
	permanent	= TRUE;
	description = "Ich will mich den S�ldnern anschlie�en!";
};                       

FUNC INT DIA_Buster_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Buster_Duell == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WannaJoin_Info()
{	
	AI_Output (other, self,"DIA_Buster_WannaJoin_15_00"); //Ich will mich den S�ldnern anschlie�en!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_01"); //Wer so feste draufhauen kann wie du, sollte es hier nicht allzu schwer haben.
		}
		else //FIGHT_WON
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_02"); //Du bist zwar nicht der beste K�mpfer, aber feige bist du nicht.
		};
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_03"); //Meine Stimme z�hlt zwar nicht viel, weil ich noch nicht lange dabei bin, aber wenn Lee mich fragt, werde ich f�r dich stimmen.
		Buster_Duell = TRUE;
		Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
		B_LogEntry (TOPIC_SLDRespekt,"Nachdem ich Buster besiegt habe, hat er nichts dagegen einzuwenden, das ich mich den S�ldnern anschlie�e.");
	}
	else //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_04"); //Du? Ich kann mich nicht erinnern, dass jemals ein Feigling bei den S�ldnern aufgenommen wurde ...
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_05"); //In einem Duell davon zu rennen - so kommst du hier nicht weit!
		};
	};
};

// ************************************************************
// 		  				 Mehr �ber S�ldner		
// ************************************************************
var int Buster_SentenzaTip;

INSTANCE DIA_Buster_OtherSld (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_OtherSld_Condition;
	information	= DIA_Buster_OtherSld_Info;
	permanent	= FALSE;
	description = "Ich will mehr �ber die S�ldner und die Gegend hier herausfinden.";
};                       

FUNC INT DIA_Buster_OtherSld_Condition()
{
	if ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
		{
				return TRUE;	
		};
};
 
FUNC VOID DIA_Buster_OtherSld_Info()
{	
	AI_Output (other, self,"DIA_Buster_OtherSld_15_00"); //Ich will mehr �ber die S�ldner und die Gegend hier herausfinden.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_01"); //�ber die Gegend kann ich dir nicht viel erz�hlen. Da fragst du am Besten die Bauern.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_02"); //Und was uns S�ldner betrifft - wir haben eine ganz einfache Regel: Wer sich durchsetzen kann, der ist dabei.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_03"); //Ich glaube, du h�ttest das Zeug dazu, einer von uns zu werden.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_04"); //Aber nur, weil du in unserem letzten Kampf Gl�ck hattest, solltest du nicht �berm�tig werden.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_05"); //Es gibt 'ne Menge Jungs auf dem Hof, die noch 'ne ganze Ecke besser sind als ich ...
		AI_Output (self, other,"DIA_Buster_OtherSld_13_06"); //Sentenza zum Beispiel. Er bewacht den Zugang zur Farm. Leg dich blo� nicht mit ihm an.
		Buster_SentenzaTip = TRUE;
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		//NICHTS (s.o.)
	}
	else  //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_07"); //Aber was erz�hl ich DIR das, du Waschlappen!
		AI_StopProcessInfos (self);		
	};
};

// ************************************************************
// 		  				About Sentenza		
// ************************************************************
var int Buster_GoldZumBrennen;
var int Buster_Bonus;

INSTANCE DIA_Buster_AboutSentenza (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_AboutSentenza_Condition;
	information	= DIA_Buster_AboutSentenza_Info;
	permanent	= FALSE;
	description = "Was ist mit diesem Sentenza?";
};                       

FUNC INT DIA_Buster_AboutSentenza_Condition()
{
	if (Buster_SentenzaTip == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_AboutSentenza_Info()
{	
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_00"); //Was ist mit diesem Sentenza?
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_01"); //Er wird dir Gold abkn�pfen wollen, wenn du zur Farm gehst - das macht er bei jedem Neuen.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_02"); //Und wenn ich du w�re, dann w�rde ich bezahlen. Das hab ich damals auch getan. Und das Gute daran war, dass er danach f�r mich gestimmt hat.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_03"); //Eine Hand w�scht die andere, hat er gemeint. Ich bin zwar all mein Gold losgeworden. Aber es war sowieso nicht viel. Und am Ende war ich froh dar�ber.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_04"); //Ich hab mal gesehen, wie er einen Kerl verpr�gelt hat, der NICHT bezahlen wollte.
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_05"); //Danke f�r den Tipp.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_06"); //Nicht wahr? Denkst du, er ist dir was wert?

	Info_ClearChoices (DIA_Buster_AboutSentenza);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Nein.", DIA_Buster_AboutSentenza_No);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Hier - nimm 5 Goldst�cke.", DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_Give_15_00"); //Hier - nimm 5 Goldst�cke.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_Give_13_01"); //Danke, Mann. Jetzt kann ich mir heute Abend doch wieder einen brennen. Ich werd's dir nicht vergessen.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_No_15_00"); //Nein.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_No_13_01"); //Dacht ich mir.
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

// ************************************************************
// 		  				 LeeLeader		
// ************************************************************

INSTANCE DIA_Buster_LeeLeader (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_LeeLeader_Condition;
	information	= DIA_Buster_LeeLeader_Info;
	permanent	= FALSE;
	description = "Lee ist der Anf�hrer der S�ldner, oder etwa nicht?";
};                       

FUNC INT DIA_Buster_LeeLeader_Condition()
{
	if (Buster_Duell == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_LeeLeader_Info()
{	
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_00"); //Lee ist der Anf�hrer der S�ldner, oder etwa nicht?
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_01"); //Stimmt - hey, jetzt wei� ich auch, woher ich dich kenne! Du bist auch in der Kolonie gewesen.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_02"); //(seufzt) Ja, das war ich.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_03"); //Hab dich nicht mehr gesehen, als der gro�e Knall passierte. Auch 'ne ganze Weile vorher nicht.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_04"); //Ich hatte andere Probleme.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_05"); //Da hast du 'ne Menge verpasst - seit wir zusammen im Knast sa�en, hat sich Einiges ver�ndert.
};


// ************************************************************
// 		  				 WhatHappened		
// ************************************************************

INSTANCE DIA_Buster_WhatHappened (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WhatHappened_Condition;
	information	= DIA_Buster_WhatHappened_Info;
	permanent	= FALSE;
	description = "Was ist aus den S�ldnern der Kolonie geworden? ";
};                       

FUNC INT DIA_Buster_WhatHappened_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Buster_LeeLeader))
	&& ((hero.guild != GIL_SLD)&& (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WhatHappened_Info()
{	
	AI_Output (other, self,"DIA_Buster_WhatHappened_15_00"); //Was ist aus den S�ldnern der Kolonie geworden?
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_01"); //Nachdem die Barriere weg war, hat uns Lee aus der Kolonie gef�hrt. Er sagte, wenn wir alle zusammenhalten, kann uns nichts passieren. Und er hatte recht.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_02"); //Es hat nicht lange gedauert, bis wir hier ein gem�tliches Pl�tzchen gefunden haben. Der Gro�bauer bezahlt uns, damit wir die Milizen aus der Stadt verpr�geln.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_03"); //Und das h�tten die Meisten von uns sogar ohne Bezahlung gemacht.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_04"); //Aber Onar f�ttert uns alle durch und wir k�nnen hier in Ruhe auf eine gute Gelegenheit warten, von dieser verdammten Insel runterzukommen.
};


//**************************************
//			TrainingGold
//************************************** 
INSTANCE DIA_Buster_Teach (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 8;
	condition	= DIA_Buster_Teach_Condition;
	information	= DIA_Buster_Teach_Info;
	permanent	= TRUE;
	description = "Kannst du mir beibringen, besser zu k�mpfen?";
};                       

FUNC INT DIA_Buster_Teach_Condition()
{	
	if (Npc_GetTalentSkill (other, NPC_TALENT_1H) <= 60) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_Teach_Info()
{	
	AI_Output (other, self, "DIA_Buster_Teach_15_00"); //Kannst du mir beibringen, besser zu k�mpfen?
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_01"); //Kann schon sein, dass ich dir den einen oder anderen Tipp geben kann ...
	}
	else 
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_02"); //Du bist ja gar nicht so dumm, wie du aussiehst. Na gut, ich werd dir beibringen, was ich wei�. Dann hast du vielleicht sogar 'ne faire Chance gegen mich ...
	};
	
	if (BusterLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Buster kann mich im einh�ndigen Kampf trainieren.");
		BusterLOG = TRUE;
	};
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_Back ()
{
	Info_ClearChoices (DIA_Buster_Teach);
};

FUNC VOID DIA_Buster_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Buster_KAP3_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP3_EXIT_Condition;
	information	= DIA_Buster_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Shadowbeasts
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_SHADOWBEASTS		(C_INFO)
{
	npc		 	= Sld_802_Buster;
	nr		 	= 30;
	condition	= DIA_Buster_SHADOWBEASTS_Condition;
	information	= DIA_Buster_SHADOWBEASTS_Info;
	permanent	= FALSE;
	important	= TRUE;
};

func int DIA_Buster_SHADOWBEASTS_Condition ()
{
	if ((Kapitel == 3) || (Kapitel == 4))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

func void B_DIA_Buster_SHADOWBEASTS_OK ()
{
	AI_StopProcessInfos (self);
};

func void DIA_Buster_SHADOWBEASTS_Info ()
{
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_00"); //Hey, du, Kollege!
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_01"); //Was willst du?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_02"); //Ich habe die letzten Tage dar�ber nachgedacht, wie man hier in diesem Kaff an Geld kommen kann.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_03"); //Und?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_04"); //Ich glaube, ich habe da eine M�glichkeit aufgetan, wie wir schnelles Geld machen k�nnen.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_05"); //Ein H�ndler aus der Stadt w�rde f�r eine bestimmte Sache eine Menge Kohle springen lassen.

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Von welchem H�ndler sprichst du da?", DIA_Buster_SHADOWBEASTS_wer );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Um was geht es?", DIA_Buster_SHADOWBEASTS_was );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Warum erz�hlst du mir das?", DIA_Buster_SHADOWBEASTS_ich );

};
func void DIA_Buster_SHADOWBEASTS_ich ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_00"); //Warum erz�hlst du mir das?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_01"); //Ich kann es nicht machen. Ich muss hier bleiben und auf die d�mlichen Schafe aufpassen.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_02"); //Du meinst die Bauern.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_03"); //Sag ich doch.

};
func void DIA_Buster_SHADOWBEASTS_was ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_15_00"); //Um was geht es?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_01"); //Der H�ndler meint, dass er Schattenl�uferh�rner sehr gewinnbringend vermarkten kann.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_02"); //Jemand m�sste in den Wald gehen und diese Biester ausschlachten. Und da habe ich an dich gedacht.

	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Wieviel ist denn da zu holen?", DIA_Buster_SHADOWBEASTS_was_wieviel );
};
func void DIA_Buster_SHADOWBEASTS_was_wieviel ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_00"); //Wie viel ist denn da zu holen?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_01"); //Eine Menge Geld sag ich dir. Auf jeden Fall wird es sich f�r uns beide lohnen.
	if (Buster_GoldZumBrennen == TRUE)
	{
		AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_02"); //Und weil du mir damals das Gold gegeben hast, mach ich dir 'nen Sonderpreis.
	};
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_03"); //Klingt gut! Du h�rst von mir, wenn ich an H�rner rankomme.
	MIS_Buster_KillShadowbeasts_DJG = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Buster_KillShadowbeasts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts, LOG_RUNNING);
	B_LogEntry (TOPIC_Buster_KillShadowbeasts,"Buster macht mir einen guten Preis f�r jedes Schattenl�uferhorn, das ich ihm bringe."); 

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
};
func void DIA_Buster_SHADOWBEASTS_wer ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_wer_15_00"); //Von welchem H�ndler sprichst du da?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_01"); //Ne, Kollege. Ich bin doch nicht d�mlich und verrate meine Quelle. Da bist du an den Falschen geraten, mein Lieber.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_02"); //Entweder du machst den Deal mit MIR oder gar nicht, klar?

};

///////////////////////////////////////////////////////////////////////
//	Info BringTrophyShadowbeast
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_BringTrophyShadowbeast		(C_INFO)
{
	npc		 = 	Sld_802_Buster;
	nr		 = 	2;
	condition	 = 	DIA_Buster_BringTrophyShadowbeast_Condition;
	information	 = 	DIA_Buster_BringTrophyShadowbeast_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wegen den H�rnern der Schattenl�ufer...";
};

func int DIA_Buster_BringTrophyShadowbeast_Condition ()
{
	if (MIS_Buster_KillShadowbeasts_DJG == LOG_RUNNING)
	&& ((Npc_HasItems (other,ItAt_ShadowHorn))||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

var int BusterTrophyShadowbeastCounter;

func void DIA_Buster_BringTrophyShadowbeast_Info ()
{
	if ((Kapitel >= 5))
	{
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_00"); //Mein Stadth�ndler hat sich verabschiedet.
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_15_01"); //Was hei�t das?
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_02"); //Er ist tot. Du kannst die H�rner behalten. Ich kann damit jetzt auch nichts mehr anfangen.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS; //Joly: Feierabend ab Kapitel 5!!!!!!!
		B_GivePlayerXP (XP_Ambient);
	}
	else if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output			(other, self, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03"); //Wie weidet man die Schattenl�ufer aus?
		AI_Output			(self, other, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04"); //Das wei�t du nicht? Oh Mann, ich h�tte mehr von dir erwartet.
	
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, "Ich komm noch darauf zur�ck.", DIA_Buster_BringTrophyShadowbeast_back );
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, B_BuildLearnString ("Bring es mir bei",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Buster_BringTrophyShadowbeast_teach );
	}
	else 
	{
		var int BusterTrophyShadowbeastCount;
		var int XP_BringBusterTrophyShadowbeast;
		var int XP_BringBusterTrophyShadowbeasts;
		var int BustersBusterTrophyShadowbeastOffer;
		var int BusterTrophyShadowbeastGeld;
	
		BusterTrophyShadowbeastCount = Npc_HasItems(other, ItAt_ShadowHorn);
		XP_BringBusterTrophyShadowbeast = 	(Shadowbeast.level * XP_PER_VICTORY);			
		BustersBusterTrophyShadowbeastOffer = Value_ShadowHorn + Buster_Bonus; //Joly: Wert ohne Handelmultiplier!!!!!!!!!!!!!
		
	
		if (BusterTrophyShadowbeastCount == 1)
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_05"); //Ich habe ein Schattenl�uferhorn f�r dich.
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeast);
				B_GiveInvItems (other, self, ItAt_ShadowHorn,1);
				BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_06"); //Ich hab hier noch Schattenl�uferh�rner f�r deinen H�ndler.
	
				B_GiveInvItems (other, self, ItAt_ShadowHorn,  BusterTrophyShadowbeastCount);
	
				XP_BringBusterTrophyShadowbeasts = (BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast);
				BusterTrophyShadowbeastCounter = (BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount); 
	
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeasts);
			};
	
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_07"); //Gut. Her damit. Besorge mir mehr. Wer wei�, wie lange der Stadth�ndler die Dinger noch haben will.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_08"); //Hier hast du deinen Anteil.
	
		BusterTrophyShadowbeastGeld	= (BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer);
	
		CreateInvItems (self, ItMi_Gold, BusterTrophyShadowbeastGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, BusterTrophyShadowbeastGeld);
	};

};
func void DIA_Buster_BringTrophyShadowbeast_teach ()
{
	AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_teach_15_00"); //Bring es mir bei.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_01"); //Also pass auf. Du erlegst den Schattenl�ufer und h�ltst sein Horn mit der rechten Hand so fest wie du kannst.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_02"); //Dann stichst du mit deinem Messer in die Stirn und schneidest eine Furche in das Fleisch um das Horn herum.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_03"); //Zu guter Letzt hebelst du mit dem Messer das Horn aus seinem Sch�del und steckst es dir in die Tasche.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_04"); //Tja. Und dann bringst es mir. Das wirst du doch wohl noch hinkriegen.
		};		
	Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back ()
{
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_back_15_00"); //Ich komm noch darauf zur�ck.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_back_13_01"); //Na hoffentlich.
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Buster_KAP4_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP4_EXIT_Condition;
	information	= DIA_Buster_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		  				 	PERM Kapitel 4	
// ************************************************************

INSTANCE DIA_Buster_Perm4 (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_Perm4_Condition;
	information	= DIA_Buster_Perm4_Info;
	permanent	= TRUE;
	description = "Was h�ltst du von der Sache mit den Drachenj�gern?";
};                       

FUNC INT DIA_Buster_Perm4_Condition()
{
	if (Kapitel >= 4) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Perm4_Info()
{	
	AI_Output (other, self,"DIA_Buster_Perm4_15_00"); //Was h�ltst du von der Sache mit den Drachenj�gern?
	AI_Output (self, other,"DIA_Buster_Perm4_13_01"); //Die Jungs k�nnen 'ne Menge Gold absahnen - wenn sie nicht dabei draufgehen.
	AI_Output (self, other,"DIA_Buster_Perm4_13_02"); //Ich selber halte mich lieber an Lee.
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Buster_KAP5_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP5_EXIT_Condition;
	information	= DIA_Buster_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Buster_KAP6_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP6_EXIT_Condition;
	information	= DIA_Buster_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Buster_PICKPOCKET (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 900;
	condition	= DIA_Buster_PICKPOCKET_Condition;
	information	= DIA_Buster_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Buster_PICKPOCKET_Condition()
{
	C_Beklauen (34, 60);
};
 
FUNC VOID DIA_Buster_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Buster_PICKPOCKET);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_BACK 		,DIA_Buster_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Buster_PICKPOCKET_DoIt);
};

func void DIA_Buster_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};
	
func void DIA_Buster_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};








































