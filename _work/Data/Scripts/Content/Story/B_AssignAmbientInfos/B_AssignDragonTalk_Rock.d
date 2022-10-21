// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Rock_Exit_Condition;
	information	= DIA_Dragon_Rock_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Rock_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Rock_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Rock_Exit_20_00"); //Genug der Worte. Deine kurzweilige Macht ist dahin. Das Auge ist kraftlos. Jetzt wirst du sterben.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Rock_Hello_Condition;
	information	= DIA_Dragon_Rock_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Rock_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Rock_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Rock_Hello_20_00"); //Noch so ein vermessener Wicht, der sich auf meinen Felsen traut. Ihr kleinen Menschen. So mutig, doch so zerbrechlich.
	if (Mis_KilledDragons == 0)
	{
		AI_Output			(other, self, "DIA_Dragon_Rock_Hello_15_01"); //Du kannst tatsächlich sprechen.
	};
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_02"); //Ich werde dir die Eingeweide herausreißen und dich an die Ratten verfüttern.
	AI_Output (other, self, "DIA_Dragon_Rock_Add_15_00"); //Nicht so schnell. Ich trage das Auge Innos bei mir. Du wirst mir gehorchen und mir meine Fragen beantworten.
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_04"); //(Brüllt) Arrh. Stell deine Fragen.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Rock_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Rock_WERBISTDU_Info;

	description	 = 	"Wer bist du?";
};

func int DIA_Dragon_Rock_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_WERBISTDU_15_00"); //Wer bist du?
	AI_Output			(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //Ich heiße Pedrakhan und ich werde dir ganz langsam das Fell abziehen, wenn ich dich zu fassen kriege.

};


///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Rock_HIERARCHIE_Condition;
	information	 = 	DIA_Dragon_Rock_HIERARCHIE_Info;

	description	 = 	"Wer von euch Drachen ist der Stärkste?";
};

func int DIA_Dragon_Rock_HIERARCHIE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //Wer von euch Drachen ist der Stärkste?
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //Unsere Macht beziehen wir aus den Elementen dieser Welt. Ihre Hierarchie ist klar und einfach.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //Aus weicher Erde geformtes Land spendet Leben für alle Kreaturen unter der Sonne. Doch verschlingt es dich mit Haut und Haaren, wenn man ihm zu nahe kommt.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //Mit Stolz erhebt sich der Fels, der lieber bricht, als jemals nachzugeben, und begräbt so die Unachtsamen unter sich. Und doch bietet er den besten Schutz vor den Gezeiten.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //Der Funke des Lebens lebt in den tiefen Feuern dieser Erde. Und doch verbrennt das Feuer alles in einem Atemzug und hinterlässt nicht mehr als Asche.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //Alle unsere Elemente erhalten und zerstören. Nur im zu hartem Guss erstarrten Wasser wird alles zur ewig verweilenden Salzsäule, wo kaum Leben möglich ist.

};


//**********************************************************************************
//		B_AssignDragonTalk_Rock
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Rock (var c_NPC slf)
{
	DIA_Dragon_Rock_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






