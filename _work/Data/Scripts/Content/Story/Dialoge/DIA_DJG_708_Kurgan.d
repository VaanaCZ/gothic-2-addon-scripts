
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kurgan_EXIT   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 999;
	condition   = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (Biff,400);	//Joly: Damit Biff nicht sofort am Anfang Kohle einfordert.
};

//************************************************************************
//	Hello
//************************************************************************
instance DIA_Kurgan_HELLO		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_HELLO_Condition;
	information	= 	DIA_Kurgan_HELLO_Info;

	important	= 	TRUE;
};

func int DIA_Kurgan_HELLO_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_HELLO_Info ()
{
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_00"); //Hey du! Typen wie du sollten aufpassen, wo sie hingehen.
	AI_Output			(other,self , "DIA_Kurgan_HELLO_15_01"); //Was willst du mir damit sagen?
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_02"); //Ich will sagen, dass die Luft hier draußen verdammt dünn ist. Hier wimmelt es nur so von Orks und Monstern.
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_03"); //Von den Drachen ganz zu schweigen. Ist nur 'ne gut gemeinte Warnung.
	B_LogEntry (TOPIC_Dragonhunter,"Eine Gruppe von Drachenjägern empfing mich am Eingang des Minentals. Die Jungs sind schwer bewaffnet, aber ich fürchte, dass sie keinen grossen Eindruck auf die Drachen machen werden.");
};

//**************************************************************************
//	Was sonst noch?
//**************************************************************************

instance DIA_Kurgan_ELSE		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_ELSE_Condition;
	information	= 	DIA_Kurgan_ELSE_Info;
	description	= 	"Kannst du mir auch was erzählen, was ich noch nicht weiß?";

};

func int DIA_Kurgan_ELSE_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_ELSE_15_00"); //Kannst du mir auch was erzählen, was ich noch nicht weiß?
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_01"); //Ich kann dir einen guten Rat geben und der ist sogar ganz umsonst.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_02"); //Wir können hier niemanden gebrauchen, der schon beim kleinsten Drachenfurz gleich in Ohnmacht fällt.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_03"); //Geh nach Hause, das ist 'ne Sache für ganze Kerle.
	
};

//**************************************************************************
//	Bist du hier der Anführer?
//**************************************************************************

instance DIA_Kurgan_Leader		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_Leader_Condition;
	information	= 	DIA_Kurgan_Leader_Info;
	description	= 	"Bist du hier der Anführer?";

};

func int DIA_Kurgan_Leader_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_Leader_15_00"); //Bist du hier der Anführer?
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_01"); //Seh ich so aus? Bestimmt nicht. Wir brauchen keine Wichtigtuer, die uns rumkommandieren.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_02"); //Als Sylvio versucht hat, hier den Boss raushängen zu lassen, haben wir ihm mitsamt seinen Freunden mal gezeigt, was wir davon halten.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_03"); //Es gab 'ne Keilerei. Anschließend sind sie auf eigene Faust losgezogen.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_04"); //Hoffentlich ist Sylvio in einem orkischen Kochtopf gelandet.
};

//**************************************************************************
//	Wolltet ihr nicht ein paar Drachen töten?
//**************************************************************************

instance DIA_Kurgan_KillDragon		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_KillDragon_Condition;
	information	= 	DIA_Kurgan_KillDragon_Info;
	description	= 	"Ihr wollt also Drachen töten?";

};

func int DIA_Kurgan_KillDragon_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kurgan_Leader))
		{
				return TRUE;
		};
};
var int Kurgan_KillDragon_Day;
func void DIA_Kurgan_KillDragon_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_00"); //(spöttisch) Ihr wollt also Drachen töten?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_01"); //Klugscheißer. Weißt du denn, wie man einen Drachen zur Strecke bringt?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_02"); //Meinst du, das Vieh wartet, bis du ihm in aller Ruhe den Kopf vom Hals schlägst?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_03"); //So etwas braucht gute Planung und entschlossenes Vorgehen.
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_04"); //Verstehe, und wie wollt ihr vorgehen?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_05"); //Wir werden erst mal auskundschaften, wo wir die Viecher finden.
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_06"); //Erst dann machen wir uns Gedanken, wie wir am besten zuschlagen.

	
	Kurgan_KillDragon_Day = Wld_GetDay(); 

	Info_AddChoice	(DIA_Kurgan_KillDragon, "Wäre interessant dabei zuzusehen, aber ich muß weiter.", DIA_Kurgan_KillDragon_weg );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Wie wollt ihr an den Orks vorbei?"					, DIA_Kurgan_KillDragon_orks );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Ich glaube, ihr findet nicht mal ein blindes Schaf.", DIA_Kurgan_KillDragon_spott );


};
func void DIA_Kurgan_KillDragon_spott ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_spott_15_00"); //Ich glaube, ihr findet nicht mal ein blindes Schaf.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_spott_01_01"); //Was? Ich soll dir wohl deine dämliche Fresse einschlagen?
	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Kurgan_KillDragon_orks ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_orks_15_00"); //Wie wollt ihr an den Orks vorbei?
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_orks_01_01"); //Über solche Kleinigkeiten machen wir uns später Sorgen.

};

func void DIA_Kurgan_KillDragon_weg ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_weg_15_00"); //Wäre interessant, dabei zuzusehen, aber ich muss weiter.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_weg_01_01"); //Sieh zu, dass du wieder über den Pass kommst. Sonst fehlt dir nachher noch eins deiner Gliedmaßen.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info SEENDRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Kurgan_SEENDRAGON		(C_INFO)
{
	npc		 = 	DJG_708_Kurgan;
	condition	 = 	DIA_Kurgan_SEENDRAGON_Condition;
	information	 = 	DIA_Kurgan_SEENDRAGON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Hast du schon einen Drachen gesehen?";
};

func int DIA_Kurgan_SEENDRAGON_Condition ()
{
	if (Kurgan_KillDragon_Day<=(Wld_GetDay()-2))
		{
				return TRUE;
		};
};

func void DIA_Kurgan_SEENDRAGON_Info ()
{
	AI_Output			(other, self, "DIA_Kurgan_SEENDRAGON_15_00"); //Hast du schon einen Drachen gesehen?
	AI_Output			(self, other, "DIA_Kurgan_SEENDRAGON_01_01"); //Bisher noch nicht. Aber die Biester können sich ja nicht ewig verstecken.
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kurgan_AllDragonsDead   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 5;
	condition   = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "Die Drachen sind tot.";
				
};

FUNC INT DIA_Kurgan_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kurgan_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kurgan_AllDragonsDead_15_00"); //Die Drachen sind tot.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_01"); //Ha, wer soll sie denn getötet haben? Die Paladine?
	AI_Output 	(other,self ,"DIA_Kurgan_AllDragonsDead_15_02"); //Ich.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_03"); //(lacht) Hah. Das glaubst du doch selbst nicht. Hör auf, mich zu verarschen.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kurgan_PICKPOCKET (C_INFO)
{
	npc			= DJG_708_Kurgan;
	nr			= 900;
	condition	= DIA_Kurgan_PICKPOCKET_Condition;
	information	= DIA_Kurgan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Kurgan_PICKPOCKET_Condition()
{
	C_Beklauen (34, 120);
};
 
FUNC VOID DIA_Kurgan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_BACK 		,DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};
	
func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};




