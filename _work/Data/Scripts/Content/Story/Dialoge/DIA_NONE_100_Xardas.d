// ************************************************************
// 			  				FIRST EXIT 
// ************************************************************

INSTANCE DIA_Xardas_FirstEXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_FirstEXIT_Condition;
	information	= DIA_Xardas_FirstEXIT_Info;
	permanent	= FALSE;
	description = "Ich werde so schnell wie möglich aufbrechen! (ENDE)";
};
                       
FUNC INT DIA_Xardas_FirstEXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Xardas_FirstEXIT_Info()
{	
	AI_Output (other, self,"DIA_Xardas_FirstEXIT_15_00"); //Ich werde so schnell wie möglich aufbrechen!
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_01"); //Gut! Und eines noch: Verrate niemandem, dass du mit mir gesprochen hast. Vor allem keinem Magier.
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_02"); //Seit ich ins Exil gegangen bin, hält mich der Kreis des Feuers für tot, und das ist auch gut so.
	
	AI_StopProcessInfos	(self);
	
	B_Kapitelwechsel (1, NEWWORLD_ZEN);	//Joly: muß auf jeden Fall hier kommen. Allein schon wegen XP_AMBIENT!
	
	Npc_ExchangeRoutine (self,"START");
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Xardas_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_EXIT_Condition;
	information	= DIA_Xardas_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_EXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
var int Addon_zuerst;
// ------------------------------------------------------------
instance DIA_Xardas_Hello (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 1;
	condition	= DIA_Xardas_Hello_Condition;
	information	= DIA_Xardas_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Xardas_Hello_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Xardas_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //Da bist du ja wieder! (schmunzelt) Ich hätte nicht gedacht, daß wir uns nochmal wiedersehen.
	AI_Output (other, self, "DIA_Addon_Xardas_Hello_15_01"); //Ich fühle mich, als hätte ich drei Wochen unter Steinen gelegen.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_02"); //So war es auch. Nur die Magie deiner Rüstung hat dich am Leben gehalten 
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_03"); //Ich hatte schon befürchtet, dich nicht mehr aus den Trümmern des Tempels befreien zu können.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_04"); //Aber genug davon. Jetzt bist du ja hier.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_05"); //Es gibt eine NEUE Bedrohung, um die wir uns kümmern müssen.

 	Info_ClearChoices	(DIA_Xardas_Hello);
	Info_AddChoice	(DIA_Xardas_Hello, "Genug Zeit haben wir ja jetzt. Der Schläfer ist besiegt.", DIA_Addon_Xardas_Hello_Dragons );
	Info_AddChoice	(DIA_Xardas_Hello, "Von welcher NEUEN Bedrohung sprichst du?", DIA_Addon_Xardas_Hello_Man );
};
func void DIA_Addon_Xardas_Hello_Man ()
{
	PlayVideo ("Intro_ADDON");
	AI_Output (self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //Verbünde dich mit ihnen! Nur so können wir Beliar Einhalt gebieten!
	
	Addon_zuerst = TRUE;
};
func void DIA_Addon_Xardas_Hello_Dragons ()
{
	AI_Output (other,self ,"DIA_Xardas_Hello_15_03"); //Genug Zeit haben wir ja jetzt. Ich habe es geschafft. Der Schläfer ...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_04"); //... wurde verbannt. Du hast ihn besiegt, das ist richtig - aber den Krieg, der jetzt folgt, können wir nicht mehr aufhalten.
	//AI_Output (other,self ,"DIA_Xardas_Hello_15_05"); //Du redest von den Orks?
	//AI_Output (self ,other,"DIA_Xardas_Hello_14_06"); //Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_07"); //Der Schläfer hat mit seinem letzten, wutentbrannten Schrei die Armeen der Finsternis in Bewegung gesetzt.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_08"); //Es war ein Befehl an alle bösen Kreaturen. Ein Wort der Macht, dem sie alle gehorchen mussten.
 	AI_Output (self ,other,"DIA_Xardas_Hello_14_09"); //Sein letzter Befehl war: KOMMT! Und sie kamen. Alle. Sogar die Drachen.
 	AI_Output (other,self ,"DIA_Xardas_Hello_15_10"); //(erstaunt) ... Drachen!
	AI_Output (self ,other,"DIA_Xardas_Hello_14_11"); //Es sind Kreaturen von uralter Macht. Ich kann ihre Gegenwart spüren - selbst hier.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_12"); //Und sie haben eine ganze Armee von niederen Dienerkreaturen um sich geschart.
	AI_Output (other,self ,"DIA_Xardas_Hello_15_13"); //Wo ist diese Armee jetzt?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_14"); //Die Armee lagert nicht weit von hier, im Minental von Khorinis, und sie bereitet sich auf den Angriff vor.
		
	if (Addon_zuerst == TRUE)
	{
		AI_Output (self ,other,"DIA_Xardas_Hello_14_15"); //(nachdenklich) Uns bleibt nicht mehr viel Zeit.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //Aber das ist nicht alles. Es gibt noch eine ANDERE Bedrohung, von der ich erst kürzlich erfahren habe.
		Info_ClearChoices	(DIA_Xardas_Hello);
		Info_AddChoice	(DIA_Xardas_Hello, "Von welcher ANDEREN Bedrohung sprichst du?", DIA_Addon_Xardas_Hello_Man );
	};
};
	
///////////////////////////////////////////////////////////////////////
//	Info AWAY
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_AWAY (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_AWAY_Condition;
	information	 = 	DIA_Xardas_AWAY_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Dann lass uns machen, dass wir hier wegkommen!";
};

func int DIA_Xardas_AWAY_Condition ()
{	
	if (!Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (!Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info ()
{
	AI_Output (other, self, "DIA_Xardas_AWAY_15_00"); //Dann lass uns machen, dass wir hier wegkommen!
	AI_Output (self, other, "DIA_Xardas_AWAY_14_01"); //Wenn wir fliehen, dann nur, um uns den Drachen später zu stellen.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_02"); //Mit der Hilfe der Soldaten und der Magier aus dieser Gegend können wir sie aufhalten, bevor sie sich ihre Armee vollständig formiert hat.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_03"); //Eine bessere Chance werden wir nicht bekommen.
};

///////////////////////////////////////////////////////////////////////
//	Info TODO
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_TODO (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	1;
	condition	 = 	DIA_Xardas_TODO_Condition;
	information	 = 	DIA_Xardas_TODO_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Was können wir tun?";
};

func int DIA_Xardas_TODO_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_TODO_Info ()
{
	AI_Output (other, self, "DIA_Xardas_TODO_15_00"); //Was können wir tun?
	AI_Output (self, other, "DIA_Xardas_TODO_14_01"); //Diesmal schaffen wir es nicht alleine. Nur die Macht Innos' kann uns gegen die Drachen helfen.
	AI_Output (self, other, "DIA_Xardas_TODO_14_02"); //In der Stadt Khorinis, nicht weit von hier, lagert eine Gruppe von Paladinen.
	AI_Output (self, other, "DIA_Xardas_TODO_14_03"); //Sie verfügen über ein mächtiges Artefakt, mit dessen Hilfe wir die Drachen besiegen können.
	AI_Output (self, other, "DIA_Xardas_TODO_14_04"); //Sie nennen es 'Das Auge Innos'. Du musst dir dieses Artefakt besorgen.
	AI_Output (self, other, "DIA_Xardas_TODO_14_05"); //Berichte den Paladinen von der Bedrohung. Du MUSST ihren Anführer überzeugen, uns zu helfen!
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_07"); //Und sobald du mit ihm gesprochen hast, mußt du das Artefakt Beliarts finden.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_08"); //Es ist das Gegenstück zum Auge Innos. Es darf nicht in die Hände des Bösen fallen.
	Log_CreateTopic (TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry (TOPIC_INNOSEYE,"In der Stadt Khorinis lagert eine Gruppe von Paladinen. Sie verfügen über ein mächtiges Artefakt: 'Das Auge Innos'. Seine Macht soll uns gegen die Bedrohung durch die Drachen helfen. Ich werde die Paladine überzeugen müssen, uns in dieser Sache zu unterstützen."); 
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlate
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Xardas_StonePlate		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Xardas_StonePlate_Condition;
	information	 = 	DIA_Addon_Xardas_StonePlate_Info;

	description	 = 	"Kannst du mir etwas über diese Steintafel sagen?";
};
func int DIA_Addon_Xardas_StonePlate_Condition ()
{
	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_Xardas_StonePlate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Xardas_StonePlate_15_00"); //Kannst du mir etwas über diese Steintafel sagen?
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); //Ich habe so eine unten in der Höhlen vor meinem Turm gefunden.
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); //Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //Ich hatte erst die Vermutung, dass es sich dabei um ein magisches Artefakt handelt, aber letztlich bin ich zu dem Schluss gekommen, dass es nicht von grosser Bedeutung  ist.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //Ich habe den Sinn dieser Tafel nicht gänzlich entschlüsseln können, aber es scheint sich um die Geschichte einer sehr alten Kultur zu handeln.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //Wenn du die Tafel haben willst, dann soll sie dir gehören, ich habe keine Verwendung dafür.

	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// ***														***
// 						Addon Report
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Portal entdeckt
// ------------------------------------------------------------
instance DIA_Addon_Xardas_Portal (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_Portal_Condition;
	information	= DIA_Addon_Xardas_Portal_Info;

	description	= "Die Wassermagier haben ein Portal zu einem unbekannten Teil der Insel entdeckt...";
};

func int DIA_Addon_Xardas_Portal_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_WhatsOrnament))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //Die Wassermagier haben ein Portal zu einem unbekannten Teil der Insel entdeckt...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //Interessant...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //Sobald du etwas finden solltest, was uns WIRKLICH weiterhilft, berichte mir davon!
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //Irgendwo dort könnte das Artefakt Beliars verborgen sein. Finde es!
};

// ------------------------------------------------------------
// 						Nochmal wegen Portal
// ------------------------------------------------------------
instance DIA_Addon_Xardas_PortalAgain (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_PortalAgain_Condition;
	information	= DIA_Addon_Xardas_PortalAgain_Info;
	permanent 	= TRUE;
	description	= "Wegen des unbekannten Teiles der Insel...";
};

func int DIA_Addon_Xardas_PortalAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Xardas_Portal))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //Wegen des unbekannten Teiles der Insel...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //Belästige mich nicht mit Details. Komm wieder, wenn du wirklich etwas Brauchbares gefunden hast.
};

// ------------------------------------------------------------
// 						Addon Success
// ------------------------------------------------------------
instance DIA_Addon_Xardas_AddonSuccess (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_AddonSuccess_Condition;
	information	= DIA_Addon_Xardas_AddonSuccess_Info;

	description	= "Ich habe den unbekannten Teil der Insel erforscht...";
};

func int DIA_Addon_Xardas_AddonSuccess_Condition ()
{
	if (C_SCHasBeliarsWeapon())
	|| (Saturas_KlaueInsMeer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //Ich habe den unbekannten Teil der Insel erforscht...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //Und, was hast du gefunden?
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //Die ganze Sache drehte sich um ein mächtiges Artefakt. Die Klaue Beliars.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //Die Klaue Beliars?! Wo ist sie jetzt? Trägst du sie bei dir?

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //Ja, ich habe sie hier.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //(gierig) Höchstinteressant.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //Diese Waffe kann uns von großem Nutzen sein. Aber sie ist auch äußerst gefährlich.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //Gib gut auf dich acht! Und vor allem: Verliere sie nicht!
		B_GivePlayerXP (XP_Ambient*3);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //Ich habe sie nicht mehr...
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //Ich habe sie den Wassermagiern gegeben, damit sie sie im Meer versenken...
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //(poltert) Bist du von Sinnen? Weißt du, was du da aus deinen Händen gegeben hast?
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //Diese Waffe hätte uns von großem Nutzen sein können!
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //Ich glaube, es war besser so.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //(seufzt) Die Wege der Götter sind unergründlich...
	};
};

// --------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_WEAPON (C_INFO)		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_WEAPON_Condition;
	information	 = 	DIA_Xardas_WEAPON_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Ich brauche Waffen";
};

func int DIA_Xardas_WEAPON_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info ()
{
	AI_Output (other, self, "DIA_Xardas_WEAPON_15_00"); //Ich brauche Waffen.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_01"); //Ich kann dir nur das Wenige geben, was ich hier habe.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_02"); //Sieh dich in meinem Turm um. Alles, was du gebrauchen kannst, gehört dir.
};


///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ARTEFAKT (C_INFO)	//E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_ARTEFAKT_Condition;
	information	 = 	DIA_Xardas_ARTEFAKT_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Was genau ist das 'Auge Innos'?";
};

func int DIA_Xardas_ARTEFAKT_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ARTEFAKT_15_00"); //Was genau ist das 'Auge Innos'?
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_01"); //Es ist ein Amulett. Der Sage nach hat Innos selbst einen Teil seiner Macht in dieses Amulett gelegt.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_02"); //Es wird dir einen Teil deiner verlorenen Kraft wiedergeben, und uns helfen, die Drachen zu besiegen.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_03"); //Und es hat noch einige andere verborgene Fähigkeiten. Doch dazu mehr, wenn du das Amulett hast.
};

///////////////////////////////////////////////////////////////////////
//	Info PALADIN
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PALADIN	(C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	3;
	condition	 = 	DIA_Xardas_PALADIN_Condition;
	information	 = 	DIA_Xardas_PALADIN_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Warum sollten mir die Paladine das Auge Innos' geben?";
};
func int DIA_Xardas_PALADIN_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_PALADIN_Info ()
{
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_00"); //Warum sollten mir die Paladine das Auge Innos' geben?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_01"); //Weil du derjenige bist, der dazu bestimmt ist, es zu tragen.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_02"); //Woher willst du das wissen?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_03"); //Es gibt eine Reihe von Gründen. Der Wichtigste ist: Du hast den Schläfer besiegt. Stündest du nicht in der Gunst der Götter, wärst du jetzt tot.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_04"); //Nehmen wir mal an, du hast Recht und ich bin dazu bestimmt, das Auge Innos' zu tragen. Woher wissen die Paladine, dass es so ist?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_05"); //Das Auge sucht sich seinen Träger selbst - sobald du es in die Finger bekommst und es dir anlegst, werden die Paladine nicht mehr an deinen Worten zweifeln.
};
///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Khorinis (C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	4;
	condition	 = 	DIA_Xardas_Khorinis_Condition;
	information	 = 	DIA_Xardas_Khorinis_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Wie komme ich zur Stadt?";
};
func int DIA_Xardas_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Lothar.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Khorinis_15_00"); //Wie komme ich zur Stadt?
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_01"); //Folge einfach dem Weg von hier aus durch die Berge. Die Stadt ist groß. Du kannst sie nicht verfehlen.
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_02"); //Aber sieh dich vor! Der Weg zur Stadt ist nicht ungefährlich. Und du bist noch lange nicht wieder so stark, wie du einst warst.
};
// ************************************************************
// 			  		Zum zweiten Mal bei Xardas
// ************************************************************

instance DIA_Xardas_WhereEx (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	6;
	condition	 = 	DIA_Xardas_WhereEx_Condition;
	information	 = 	DIA_Xardas_WhereEx_Info;
	permanent	 = 	FALSE;
	description	 = 	"Wo genau sind wir hier?";
};

func int DIA_Xardas_WhereEx_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Add_15_00"); //Wo genau sind wir hier?
	AI_Output (self, other, "DIA_Xardas_Add_14_01"); //Wie ich bereits sagte, in der Nähe der Stadt Khorinis.
	AI_Output (self, other, "DIA_Xardas_Add_14_02"); //Ich habe meinen Turm hier neu errichtet.
	AI_Output (other, self, "DIA_Xardas_Add_15_03"); //Aber es ist erst wenige Tage her, daß wir uns das letzte Mal im Minental gesehen haben...
	AI_Output (self, other, "DIA_Xardas_Add_14_04"); //Die Diener, die ich rief, um meinen Turm zu bauen haben ganze Arbeit geleistet...
	AI_Output (other, self, "DIA_Xardas_Add_15_05"); //Das kann man wohl sagen.
};

instance DIA_Xardas_EQUIPMENT (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	7;
	condition	 = 	DIA_Xardas_EQUIPMENT_Condition;
	information	 = 	DIA_Xardas_EQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"Woher bekomme ich bessere Ausrüstung?";
};

func int DIA_Xardas_EQUIPMENT_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_WEAPON))
	&& (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_EQUIPMENT_15_00"); //Woher bekomme ich bessere Ausrüstung?
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_01"); //Der nächste Ort, an dem du bessere Waffen und Rüstungen bekommen kannst, ist die Stadt Khorinis.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_02"); //Aber unten im Tal findest du einige Heilpflanzen, die dir helfen werden, wenn du im Kampf verwundet werden solltest.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_03"); //Direkt vor meinem Turm ist ein See. Von dort aus gibt es einen versteckten Zugang zum Tal.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTLESTER
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ABOUTLESTER		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_ABOUTLESTER_Condition;
	information	 = 	DIA_Xardas_ABOUTLESTER_Info;
	permanent	 = 	FALSE;
	description	 = 	"Hast du schon mit Lester gesprochen?";
};
func int DIA_Xardas_ABOUTLESTER_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	&& (Npc_GetDistToWP  (Lester,"NW_XARDAS_TOWER_IN1_31") <= 500)) 
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_ABOUTLESTER_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //Hast du schon mit Lester gesprochen?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //Ja, ich habe ihn ordentlich gelöchert. Er konnte mir viel berichten, aber er ist völlig erschöpft.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //Dass er diese Flucht überhaupt überlebt hat, grenzt schon an ein Wunder. Ich habe ihn erstmal ins Bett geschickt.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //Was hat er erzählt?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //Nichts Gutes. Er hat nicht nur einen Drachen gesehen, sondern auch Männer in dunklen Kapuzenmänteln.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //Und?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //Wenn es diese Männer gibt, dann stellt ihre Anwesenheit eine mögliche Bedrohung dar.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //Und das gefällt mir nicht. Hier, nimm meinen Ring. Er wird dich vor Magie beschützen.
	
	B_GiveInvItems (self, other, ItRi_Prot_Mage_01,1);
	B_GivePlayerXP		(XP_Ambient);

};

// *************************************************************
// -------------------------------------------------------------
//						NACH erstem Exit !!!
// -------------------------------------------------------------
// ************************************************************				//x

///////////////////////////////////////////////////////////////////////
//	Bei Paladinen gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_FirstPal		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	10;
	condition	 = 	DIA_Xardas_FirstPal_Condition;
	information	 = 	DIA_Xardas_FirstPal_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ich war in der Stadt...";
};
func int DIA_Xardas_FirstPal_Condition ()
{	
	if (Lothar.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Xardas_FirstPal_Info ()
{
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_00"); //Ich war in der Stadt...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_01"); //Und? Konntest du mit dem Anführer der Paladine reden?
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_02"); //Ich werde nicht bei ihm vorgelassen ...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_03"); //Unsinn! Du wirst doch einen Weg finden, zu ihm zu kommen.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_04"); //Notfalls geh ins Kloster und werde einer der Magier.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_05"); //Das ist zwar von meinem Standpunkt aus gesehen moralisch fragwürdig. Aber es bringt dich auch zum Ziel.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_06"); //Als Magier wirst du auf jeden Fall vorgelassen.
};

///////////////////////////////////////////////////////////////////////
//	Info Weiter (Perm)
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Weiter		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	99;
	condition	 = 	DIA_Xardas_Weiter_Condition;
	information	 = 	DIA_Xardas_Weiter_Info;
	permanent	 = 	TRUE;
	description	 = 	"Wie geht's jetzt weiter? ";
};
func int DIA_Xardas_Weiter_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_Weiter_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Weiter_15_00"); //Wie geht's jetzt weiter?
	AI_Output (self, other, "DIA_Xardas_Weiter_14_01"); //Wir machen weiter wie geplant, eine andere Chance haben wir nicht.
	AI_Output (self, other, "DIA_Xardas_Weiter_14_02"); //Du besorgst dir das Auge Innos' und ich werde weiter nach den Antworten suchen.
};

INSTANCE DIA_Xardas_KdfSecret (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 9;
	condition	= DIA_Xardas_KdfSecret_Condition;
	information	= DIA_Xardas_KdfSecret_Info;
	permanent	= FALSE;
	description = "Warum darf der Kreis des Feuers nichts von dir wissen?";
};                       

FUNC INT DIA_Xardas_KdfSecret_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Xardas_KdfSecret_Info()
{	
	AI_Output	(other, self,"DIA_Xardas_KdfSecret_15_00");	//Warum darf der Kreis des Feuers nichts von dir wissen?
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_01");	//Früher war ich ein hohes Mitglied des Kreises. Ich ahnte schon damals, dass die Dämonenmagie der Schlüssel zur magischen Barriere war.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_02"); //Aber die anderen Mitglieder dieses Kreises hätte ich nie von diesem Weg überzeugen können.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_03"); //Also habe ich den Kreis verlassen, um die schwarzen Künste zu studieren.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_04"); //Für dieses Vergehen gibt es in den Augen der Feuermagier, (abfällig) der 'Geweihten Innos', der immer 'Guten' und 'Rechtschaffenen', keine Entschuldigung.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_05"); //Sie wissen mit Sicherheit, dass ich noch lebe, aber nicht, wo sie mich finden können - und das ist auch gut so.
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

INSTANCE DIA_Xardas_KAP3_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP3_EXIT_Condition;
	information	= DIA_Xardas_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BACKFROMOW		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	31;
	condition	 = 	DIA_Xardas_BACKFROMOW_Condition;
	information	 = 	DIA_Xardas_BACKFROMOW_Info;

	description	 = 	"Ich bin zurück aus dem Minental.";
};

func int DIA_Xardas_BACKFROMOW_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //Ich bin zurück aus dem Minental.
	AI_Output			(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //Das wurde auch Zeit. Was hast du gesehen?
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //Du hattest Recht. Das Land wurde überschwemmt von einer ganzen Armee des Feindes.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //Orks belagern die Burg und Drachen haben ganze Landstriche verwüstet.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //Wenn mich nicht alles täuscht, dann wird es nicht mehr lange dauern, bis sie Khorinis angreifen.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info DmtSindDa
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_DMTSINDDA		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	32;
	condition	 = 	DIA_Xardas_DMTSINDDA_Condition;
	information	 = 	DIA_Xardas_DMTSINDDA_Info;

	description	 = 	"Was zur Hölle ist in der Zwischenzeit hier passiert?";
};

func int DIA_Xardas_DMTSINDDA_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_KnowsInfo(other, DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info ()
{

 	if (Npc_KnowsInfo(other, DIA_Lester_BACKINTOWN))
	{
		AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_00"); //Lester sagte, du wolltest mich sofort sehen.
	};
	
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //Was zur Hölle ist in der Zwischenzeit hier passiert?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //Der Feind hat erfahren, wer du wirklich bist, und dass du das Auge Innos' in deinen Besitz bringen willst.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //Er hat die Bedrohung erkannt. Er sah sich gezwungen, aus seiner Deckung hervor zu treten und offen anzugreifen.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //Das Versteckspiel hat ein Ende. Während gestern noch nicht klar war, wie der Angriff des Gegners aussehen würde, kann man es jetzt kaum noch übersehen.

	B_LogEntry (TOPIC_INNOSEYE, "Der Feind hat erfahren, dass ich auf der Suche nach dem Auge Innos bin. Es wird Zeit, dass ich es endlich finde, bevor es zu spät ist.");
	
	Info_ClearChoices	(DIA_Xardas_DMTSINDDA);
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Ich bin von Magiern in schwarzer Robe angegriffen worden.", DIA_Xardas_DMTSINDDA_DMT );
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Ich habe den Beweis für Lord Hagen.", DIA_Xardas_DMTSINDDA_Beweis );

};

func void DIA_Xardas_DMTSINDDA_DMT ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //Ich bin von Magiern in schwarzen Roben angegriffen worden.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //Der Feind hat viele Gesichter. Die Suchenden sind eines davon. Sie sind die eigentlichen Drahtzieher des Feindes.
 	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //Sie haben sich an den wichtigsten Orten in Stellung begeben und wartet nur noch auf eine Gelegenheit, die Falle zuschnappen zu lassen.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //Geh ihnen aus dem Weg. Sie sind sehr mächtige magische Wesen und werden versuchen, dich mit allen Mitteln aufzuhalten.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Xardas kannte die Männer in ihren schwarzen Roben. Die Suchenden seien die eigentlichen Fädenzieher des Feindes und sehr gefährlich."); 
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //Ich habe endlich den Beweis, den Lord Hagen von mir verlagt hat.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //Was für ein Beweis ist das?
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //Ich habe einen Brief von Garond, dem Kommandanten der Paladine im Minental, erhalten. Darin fordert er Verstärkung an.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //Das sollte diesen militanten Feldherrn überzeugen. Gut gemacht.
	
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Was ist jetzt der nächste Schritt?", DIA_Xardas_DMTSINDDA_DMT_WhatToDo );
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //Was ist jetzt der nächste Schritt?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //Geh und bringe Lord Hagen den Brief von Garond, damit er dir den Zugang zum Auge Innos' gewährt.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //Dann begib dich ins Kloster und sprich mit Pyrokar. Er muss dir das Auge aushändigen.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //Es gibt nichts Wichtigeres, als das Artefakt in Sicherheit zu bringen.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //Geh jetzt, bevor es zu spät ist. Der Feind wird ebenfalls versuchen, sich dessen zu bemächtigen.
	B_LogEntry (TOPIC_INNOSEYE, "Das Auge befindet sich im Kloster der Feuermagier. Lord Hagen wird mir hoffentlich Zugang dazu gewähren, wenn ich ihm das Schreiben von Lord Garond überreiche. Nur mit Hagens Zustimmung wird mich der oberste Feuermagier Pyrokar an das Amulett heran lassen.");
};

///////////////////////////////////////////////////////////////////////
//	Info InnosEyeBroken
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_INNOSEYEBROKEN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	33;
	condition	 = 	DIA_Xardas_INNOSEYEBROKEN_Condition;
	information	 = 	DIA_Xardas_INNOSEYEBROKEN_Info;

	description	 = 	"Das Auge Innos' ist zerstört.";
};

func int DIA_Xardas_INNOSEYEBROKEN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Xardas_DMTSINDDA))
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //Das Auge Innos' ist zerstört.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //Was redest du da? Zerstört!
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //Ich habe es oben in den nördlichen Wäldern gefunden und es leider nur noch in Einzelteilen bergen können.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //Damit ist die einzige Möglichkeit, den Drachen die Stirn zu bieten, dahin. Wir haben versagt.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice	(DIA_Xardas_INNOSEYEBROKEN, "Was nun?", DIA_Xardas_INNOSEYEBROKEN_wasnun );


};
func void DIA_Xardas_INNOSEYEBROKEN_wasnun ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //Was nun?
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //Das ist ein harter Schlag. Wir müssen uns neu orientieren. Ich werde mich zurückziehen und darüber nachdenken.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //Du solltest inzwischen in die Stadt gehen und dort mit dem Wassermagier Vatras sprechen. Ich könnte mir vorstellen, dass er weiß, was zu tun ist.

	B_LogEntry (TOPIC_INNOSEYE, "Xardas war nicht gerade glücklich darüber, dass das Auge Innos zerstört ist. Der Wassermagier Vatras in der Stadt Khorinis scheint nun die einizige Hoffnung zu sein.");

	MIS_Xardas_GoToVatrasInnoseye = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info RitualRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RITUALREQUEST		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_RITUALREQUEST_Condition;
	information	 = 	DIA_Xardas_RITUALREQUEST_Info;

	description	 = 	"Vatras hat mich zu dir geschickt.";
};

func int DIA_Xardas_RITUALREQUEST_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Xardas_INNOSEYEBROKEN))
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RITUALREQUEST_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_00"); //Vatras hat mich zu dir geschickt.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //Das ist gut. Was hat er gesagt?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //Er sagte etwas von einem Umkehrritual am Sonnenkreis.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //(lacht) Der alte Teufel. Ich ahne schon, was er vor hat. Du bist gekommen, um mich zu ihm zu rufen.
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //So sieht's aus. Wann wirst du aufbrechen?

	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //Ich werde Vatras nicht warten lassen und mache mich sofort auf den Weg. Erledige deine Aufgaben und komm dann später nach.
		AI_StopProcessInfos (self);
		B_LogEntry (TOPIC_INNOSEYE, "Xardas hat zugestimmt, bei dem Ritual am Sonnenkreis zu erscheinen.");
		B_GivePlayerXP (XP_Ambient);
		Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE; 
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //Ich werde erst dem Ritual beiwohnen, wenn ich mir sicher bin, dass du bereit bist, den Drachen die Stirn zu bieten.
	};	
	B_GivePlayerXP (XP_Ambient);

};


///////////////////////////////////////////////////////////////////////
//	Info warumnichtjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WARUMNICHTJETZT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_WARUMNICHTJETZT_Condition;
	information	 = 	DIA_Xardas_WARUMNICHTJETZT_Info;

	description	 = 	"Warum gehst du nicht jetzt GLEICH zu Vatras?";
};

func int DIA_Xardas_WARUMNICHTJETZT_Condition ()
{
	if  (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
	&&	(Xardas_GoesToRitualInnosEye == FALSE)
	&& 	((hero.guild == GIL_MIL)
	|| 	 (hero.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //Warum gehst du nicht jetzt GLEICH zu Vatras? Manchmal verstehe ich dich nicht.
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //Erst gab es nichts Wichtigeres als das Auge Innos' und nun, wo du dich selbst bewegen musst, da kneifst du.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //(verärgert) Sprich nicht in diesem Ton mit mir. Ohne MICH würde dein armseliger Körper noch im Tempel liegen und vermodern.

	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Schon gut. Sag mir einfach, was ich tun muß.", DIA_Xardas_WARUMNICHTJETZT_wastun );
	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Dann erkläre mir wenigstens den Grund deines Zögerns.", DIA_Xardas_WARUMNICHTJETZT_grund );
};
func void DIA_Xardas_WARUMNICHTJETZT_grund ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //Dann erkläre mir wenigstens den Grund deines Zögerns.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //Seit ich mich von den Feuermagiern abgewendet habe, bin ich ihnen aus dem Weg gegangen.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //Ich bin auch nicht gewillt, das zu ändern, es sei denn, ich habe keine andere Wahl.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //Doch bevor ich mich den strafenden Blicken der Magier aussetze, will ich mir erst sicher sein, dass du überhaupt den Hauch einer Chance gegen die Drachen hast.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //Mit deiner schäbigen Ausrüstung wirst du jedoch nicht weit kommen. Komm erst wieder, wenn du stark genug bist.
  	AI_StopProcessInfos (self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun  ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //Schon gut. Sag mir einfach, was ich tun muss.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //Du bist noch zu schwach für den Kampf gegen die Drachen. Mit der Ausrüstung hast du nicht einmal den Hauch einer Chance.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //Komm erst wieder, wenn du dich besser vorbereitet hast. Dann werde ich mich Vatras anschließen.
 	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info bereit
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BEREIT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	condition	 = 	DIA_Xardas_BEREIT_Condition;
	information	 = 	DIA_Xardas_BEREIT_Info;

	description	 = 	"Ich bin bereit für den Kampf gegen die Drachen.";
};

func int DIA_Xardas_BEREIT_Condition ()
{
	if  (Xardas_GoesToRitualInnosEye == FALSE)
	&& 	(Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))	
	&&	((hero.guild == GIL_DJG)
	||   (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BEREIT_15_00"); //Ich bin bereit für den Kampf gegen die Drachen.
	AI_Output			(self, other, "DIA_Xardas_BEREIT_14_01"); //Dann lass uns keine Zeit verlieren. Ich werde umgehend zum Sonnenkreis aufbrechen. Erledige deine Aufgaben. Wir treffen uns dann dort.
	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_INNOSEYE, "Xardas hat zugestimmt, bei dem Ritual am Sonnenkreis zu erscheinen.");
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair"); 
	Xardas_GoesToRitualInnosEye = TRUE; 
};

///////////////////////////////////////////////////////////////////////
//	Info bingespannt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BINGESPANNT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	35;
	condition	 = 	DIA_Xardas_BINGESPANNT_Condition;
	information	 = 	DIA_Xardas_BINGESPANNT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wird das Umkehrritual funktionieren?";
};

func int DIA_Xardas_BINGESPANNT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		&& 	(Xardas_GoesToRitualInnosEye == TRUE)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_BINGESPANNT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //Wird das Umkehrritual funktionieren?
	AI_Output			(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //Ich bin mir nicht sicher. Kommt darauf an, was Vatras genau tun wird.
};

///////////////////////////////////////////////////////////////////////
//	Info PyroWillNicht
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PYROWILLNICHT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	37;
	condition	 = 	DIA_Xardas_PYROWILLNICHT_Condition;
	information	 = 	DIA_Xardas_PYROWILLNICHT_Info;

	description	 = 	"Pyrokar weigert sich, zum Ritual zu erscheinen.";
};

func int DIA_Xardas_PYROWILLNICHT_Condition ()
{
	if (Pyrokar_DeniesInnosEyeRitual == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Xardas_PYROWILLNICHT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_00"); //Pyrokar weigert sich, zum Ritual zu erscheinen.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_01"); //Er will erst einen Beweis dafür, dass er dir vertrauen kann.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //So so. Pyrokar also. Mmh, interessant.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //Der alte Zausel wird langsam lästig. Aber ich denke, ich habe da etwas für dich, was dir helfen kann.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //Damals, als ich den Orden der Feuermagier verließ, habe ich einige Dinge aus dem Kloster mit mir genommen.
	//AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); //Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich ständig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	//"hier" passt nicht, weil Xardas am Steinkreis stehen könnte - Satz ist eh überflüssig
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //Ich wollte nicht, dass eines Tages eine Truppe von Paladinen oder Feuermagiern meinen Turm auf den Kopf stellt und den Kram bei mir findet.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //Also habe ich sie an sichere Orte gebracht, an dem die Magier sicherlich nicht danach suchen würden.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //Und wo?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //Ein Teil davon liegt in einer Truhe verschlossen auf Sekobs Bauernhof.
	Sekob_RoomFree = TRUE;
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //Du traust diesem Sekob?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //Nein. Aber er ist käuflich und stellt keine unangenehmen Fragen. Außerdem habe ich die Truhe verschlossen. Hier ist der Schlüssel.

	CreateInvItems 		(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);					
	B_GiveInvItems 		(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);

	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //Es ist ein sehr altes Buch dabei. Wenn Pyrokar dieses Buch bekommt, wird er wissen, dass es von mir kommt.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //Ich habe keine Verwendung mehr dafür. Vielleicht erfüllt es ja somit noch einen Zweck.
	B_LogEntry (TOPIC_INNOSEYE, "Xardas gab mir einen Schlüssel für eine Truhe auf Sekobs Bauernhof. Ich soll das Buch darin zu Pyrokar bringen.");
};


///////////////////////////////////////////////////////////////////////
//	Info RitualInnosEyeRepairImportant
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RitualInnosEyeRepairImportant		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important	 = 	TRUE;

};

func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info ()
{
	AI_Output (self, other, "DIA_Xardas_Add_14_06"); //Nun, da das Auge Innos geheilt ist, mußt du den Drachen entgegentreten!
	AI_Output (self, other, "DIA_Xardas_Add_14_07"); //Sie alle dienen Beliar, dem Gott der Finsternis.
	AI_Output (self, other, "DIA_Xardas_Add_14_08"); //Aber es muß eine irdische Macht geben, die sie kontrolliert. Soviel ist mir inzwischen klar.
	AI_Output (self, other, "DIA_Xardas_Add_14_09"); //Finde heraus, was die Quelle dieser Macht ist.
	AI_Output (self, other, "DIA_Xardas_Add_14_10"); //Sobald du etwas herausgefunden hast, kommst du zu mir zurück!
	
	Info_ClearChoices	(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice	(DIA_Xardas_RitualInnosEyeRepairImportant, DIALOG_ENDE, DIA_Xardas_RitualInnosEyeRepairImportant_weiter );

};		

 func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
 {
	AI_StopProcessInfos (self);
	B_StartOtherRoutine (Xardas,"Start");
  	B_StartOtherRoutine	(Vatras,"Start");

 };

///////////////////////////////////////////////////////////////////////
//	Info wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WASNUN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_WASNUN_Condition;
	information	 = 	DIA_Xardas_WASNUN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Das Auge Innos' ist geheilt, was nun?";
};

func int DIA_Xardas_WASNUN_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WASNUN_15_00"); //Das Auge Innos' ist geheilt, was nun?
	AI_Output			(self, other, "DIA_Xardas_WASNUN_14_01"); //Vergiss nicht, es zu tragen, wenn du gegen die Drachen antrittst.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_02"); //Verliere keine Zeit. Geh nun ins Minental und töte die Drachen.
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_03"); //Geh zu Pyrokar und lass dir von ihm den Umgang mit dem Auge erklären.
	};
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

INSTANCE DIA_Xardas_KAP4_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP4_EXIT_Condition;
	information	= DIA_Xardas_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PERM4		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	40;
	condition	 = 	DIA_Xardas_PERM4_Condition;
	information	 = 	DIA_Xardas_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Was gibt es neues?";
};

func int DIA_Xardas_PERM4_Condition ()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PERM4_15_00"); //Was gibt es Neues?
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_01"); //Die Suchenden sind noch nicht gegangen. Sie werden nicht eher ruhen, bis sie dich zur Strecke gebracht haben.
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_02"); //Töte die Drachen im Minental und finde heraus, wer hinter diesen Angriffen steckt. Sonst wird ihre Übermacht nur noch größer.

};


//#####################################################################
//##
//##
//##							KAPITEL 5 //Xardas ist weg!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Xardas_KAP5_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP5_EXIT_Condition;
	information	= DIA_Xardas_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6 //Xardas ist auf der Dracheninsel ->neue Instanz!!!
//##
//##
//#####################################################################



INSTANCE DIA_Xardas_KAP6_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP6_EXIT_Condition;
	information	= DIA_Xardas_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



























































