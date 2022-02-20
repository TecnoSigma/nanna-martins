# frozen_string_literal: true

class Reference
  SEGMENTS = { a: 'Acessórios', v: 'Vestuário', d: 'Decoração' }.freeze
  EXCLUSIVITY = { exclusive: 'U', nonexclusive: 'G' }.freeze

  attr_reader :segment, :kind, :season, :year, :exclusivity

  private_constant :EXCLUSIVITY, :SEGMENTS

  def initialize(craft_params)
    @segment = craft_params[:segment]
    @kind = craft_params[:kind]
    @year = craft_params[:year]
    @season = craft_params[:season]
    @exclusivity = craft_params[:exclusivity]
  end

  def generate
    "#{prefix}#{numeration}"
  end

  private

  def prefix
    @prefix ||= "#{add_segment}-#{add_kind}#{year}#{add_season}#{add_exclusivity}"
  end

  def numeration
    crafts = Craft.where("reference LIKE ?", "%" + prefix + "%")

    return '0001' if crafts.empty?

    code = crafts.last.reference

    code[-4..code.length]
      .to_i
      .next
      .to_s
      .rjust(4, '0')
  end

  def add_kind
    kind[0..2].upcase
  end

  def add_season
    season[0..1].upcase
  end

  def add_segment
    SEGMENTS.key(segment).to_s.upcase
  end

  def add_exclusivity
    exclusivity ? EXCLUSIVITY[:exclusive] : EXCLUSIVITY[:nonexclusive]
  end
end
