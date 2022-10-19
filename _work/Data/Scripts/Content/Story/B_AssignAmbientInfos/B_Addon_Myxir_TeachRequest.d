///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Nauè mê tomu jazyku.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Zaèneme od nejjednoduššího. Nejdâív tê tedy nauèím jazyku rolníkù.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Základním pravidlem písemných záznamù rolníkù je, že se zabývají svêtskými záležitostmi, jako je práce, láska nebo získávání potravy.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Býval to bêžný jazyk ve mêstech. Pokud jej znáš, dokážeš pochopit vêtšinu zdejších textù.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Jazykem rolníkù už vládneš, ale jazyk váleèníkù je o nêco obtížnêjší.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Texty v tomto jazyce se vêtšinou týkají zbraní a válèení. I ty by ses z jejich záznamù mohl lecèemus pâiuèit.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //Vytâíbený jazyk knêží je skuteènê obtížné pochopit, ale rád ti s tím pomohu.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //Je to jazyk posvátných textù, které pojednávají o historii a o magii stvoâitelù.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Každý z têchto textù je skuteèným pokladem, když víš, co znamená.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //Víc už tê nauèit nemohu. Jazyk stavitelù jsi už plnê zvládl.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Bêž si vyzkoušet své nové znalosti. Uvidíš, že jazyk stavitelù už ti nebude tak nepochopitelnou záhadou.
};



