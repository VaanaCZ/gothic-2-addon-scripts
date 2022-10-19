///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rethon_EXIT   (C_INFO)
{
	npc         = DJG_709_Rethon;
	nr          = 999;
	condition   = DIA_Rethon_EXIT_Condition;
	information = DIA_Rethon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rethon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rethon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_HALLO		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	5;
	condition	 = 	DIA_Rethon_HALLO_Condition;
	information	 = 	DIA_Rethon_HALLO_Info;

	description	 = 	"Was machst du hier?";
};

func int DIA_Rethon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_HALLO_15_00"); //Was machst du hier?
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //Ich bereite mich auf den Kampf vor, was sonst?
};


 ///////////////////////////////////////////////////////////////////////
//	Info Kampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_KAMPF		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_KAMPF_Condition;
	information	 = 	DIA_Rethon_KAMPF_Info;

	description	 = 	"Gegen wen willst du kämpfen?";
};

func int DIA_Rethon_KAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_KAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //Gegen wen willst du kämpfen?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //Ich dachte mir, ich schau mal bei den Paladinen vorbei und trete ihnen in ihre fetten Ärsche.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //Idiot. Gegen die Drachen natürlich. Was hast du denn gedacht?
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_PALADINE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_PALADINE_Condition;
	information	 = 	DIA_Rethon_PALADINE_Info;

	description	 = 	"Haben die Paladine nichts dagegen, dass du hier bist?";
};

func int DIA_Rethon_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //Haben die Paladine nichts dagegen, dass du hier bist?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //Blödsinn. Die haben ganz andere Probleme. Die meisten sind froh, dass sie noch leben.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //Mit der Moral der Jungs steht es nicht zum Besten. Das wird noch ihr Untergang sein.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //Ich meine, schau dir doch mal die schartigen Klingen an, mit denen sie in die Schlacht ziehen wollen.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //Jeder vernünftige Krieger würde da doch sofort desertieren.

};


///////////////////////////////////////////////////////////////////////
//	Info WoGruppe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_WOGRUPPE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	7;
	condition	 = 	DIA_Rethon_WOGRUPPE_Condition;
	information	 = 	DIA_Rethon_WOGRUPPE_Info;

	description	 = 	"Hast du dich von deiner Gruppe getrennt?";
};

func int DIA_Rethon_WOGRUPPE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_WOGRUPPE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //Hast du dich von deiner Gruppe getrennt?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //Meine Gruppe? Ich habe keine Gruppe. Ich bin Trophäensammler.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //Wenn ich ohne Trophäe wieder nach Hause gehe, dann weiß ich nicht, wofür ich hierher gekommen bin. Da kann ich keinen anderen gebrauchen.
};


///////////////////////////////////////////////////////////////////////
//	Info drachengesehen
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_DRACHENGESEHEN		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	8;
	condition	 = 	DIA_Rethon_DRACHENGESEHEN_Condition;
	information	 = 	DIA_Rethon_DRACHENGESEHEN_Info;

	description	 = 	"Hast du schon einen Drachen zu Gesicht bekommen?";
};

func int DIA_Rethon_DRACHENGESEHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_KAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rethon_DRACHENGESEHEN_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //Hast du schon einen Drachen zu Gesicht bekommen?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //Nein. Bevor ich losziehe, werde ich erst meine Waffen auf Vordermann bringen.
};

///////////////////////////////////////////////////////////////////////
//	Info Angst
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_ANGST		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	9;
	condition	 = 	DIA_Rethon_ANGST_Condition;
	information	 = 	DIA_Rethon_ANGST_Info;

	description	 = 	"Hast du keine Angst, dass dir jemand zuvorkommt?";
};

func int DIA_Rethon_ANGST_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_WOGRUPPE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_ANGST_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //Hast du keine Angst, dass dir jemand zuvorkommt?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //Was? Wer denn? Sylvio?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //Dein Boss glaubt wirklich, er kann hier absahnen, was?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //Ich gehöre nicht zu Sylvios Leuten. Ich arbeite allein.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //Oh. Na schön. Da will ich nichts gesagt haben.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //Hast du dir die traurigen Gestalten schon mal angeguckt, die er dabei hat?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //Sylvio kann froh sein, wenn er hier wieder lebend raus kommt.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //Wird er nicht. Er ist tot.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //Auch gut.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "Du scheinst ihn nicht zu mögen.", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "Wo ist Sylvio jetzt?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "Sylvio war hier?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //Sylvio war hier?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //Hier in der Burg, meinst du? Ja, war er. Aber nur kurz.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //Hat ein paar Takte mit den Leuten hier gesprochen und ist dann wieder losgezogen.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //Du scheinst ihn nicht zu mögen.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //Was heißt mögen? Ich bin nicht sonderlich stolz darauf, ihn zu kennen.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //Sylvio hat keine Freunde. Er braucht Leute, die ihm bedingungslos folgen.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //Das ist nichts für mich. Ich arbeite allein.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //Wo ist Sylvio jetzt?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //Die Paladine hier erzählten etwas von einem Drachen aus Eis im Westen. Er soll der gefährlichste und mächtigste von allen sein.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //Da hättest du mal Sylvios glänzenden Augen sehen sollen, als er das hörte. Jetzt darfst du raten, wo er hingegangen ist.

	B_LogEntry (TOPIC_DRACHENJAGD,"Rethon der Drachenjäger faselte irgendwas von einem Drachen aus Eis."); 
	B_LogEntry (TOPIC_Dragonhunter,"Sylvio ist in der Burg gewesen und hat sich später wieder aufgemacht einen Eisdrachen zu finden.");

};



///////////////////////////////////////////////////////////////////////
//	Info meineWaffe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_MEINEWAFFE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	10;
	condition	 = 	DIA_Rethon_MEINEWAFFE_Condition;
	information	 = 	DIA_Rethon_MEINEWAFFE_Info;

	description	 = 	"Kannst du mir helfen, meine Waffe zu verbessern?";
};

func int DIA_Rethon_MEINEWAFFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_MEINEWAFFE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //Kannst du mir helfen, meine Waffen zu verbessern?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //Verbessern? Kauf dir lieber etwas Neues und wirf den Ramsch weg, den du da mit dir herum schleppst.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //Vielleicht habe ich da etwas für dich? Interessiert?
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_TRADE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	11;
	condition	 = 	DIA_Rethon_TRADE_Condition;
	information	 = 	DIA_Rethon_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	
	description	 = 	"Was kannst du mir verkaufen?";
};

func int DIA_Rethon_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_MEINEWAFFE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //Was kannst du mir verkaufen?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //Mann, bin ich runter gekommen. Jetzt verkauf ich meine Waffen schon an einen Paladin.
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //Für einen Magier habe ich eigentlich nicht so viel, aber du kannst es dir ja trotzdem ansehen.
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //Ich schätze, ich habe das, was du willst, Kollege.
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rethon_PICKPOCKET (C_INFO)
{
	npc			= DJG_709_Rethon;
	nr			= 900;
	condition	= DIA_Rethon_PICKPOCKET_Condition;
	information	= DIA_Rethon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Rethon_PICKPOCKET_Condition()
{
	C_Beklauen (78, 230);
};
 
FUNC VOID DIA_Rethon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rethon_PICKPOCKET);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_BACK 		,DIA_Rethon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rethon_PICKPOCKET_DoIt);
};

func void DIA_Rethon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};
	
func void DIA_Rethon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};


